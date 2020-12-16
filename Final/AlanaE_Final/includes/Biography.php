<?php
class Biography{
    private $artist;
    private $lifedates;
    private $title;
    private $year;
    private $author;
    private $format;
    private $category;
    private $tags;
    private $url;
    private $id;

    public function setID($dbID){ $this->id = $dbID; }
    public function setArtist($artistName){ 
        $this->artist = $artistName; 
    }
    public function getArtist(){ 
        print_r( 'Artist: '.$this->artist . '<br>'); //MODIFY OUTPUT HERE TO ADD LINK (see "Navigation using metadata" video @26:33)
    }
    public function setLifeDates($lifeDates){ 
        $this->lifedates = $lifeDates; 
    }
    public function getLifeDates(){ 
        print_r( 'Life Dates: '.$this->lifedates . '<br>'); 
    }
    public function setTitle($titleName){ 
        $this->title = $titleName; 
    }
    public function getTitle(){ 
        print_r('<b>Title: '.$this->title.'</b><br>'); 
    }
    public function setYear($releaseYear){ 
        $this->year = $releaseYear; 
    }
    public function getYear(){ 
        print_r('Year: '.$this->year . '<br>'); 
    }
    public function setAuthor($authorName){ 
        $this->author = $authorName; 
    }
    public function getAuthor(){ 
        print_r('Author/Director: '.$this->author . '<br>'); 
    }
    public function setFormat($formatType){ 
        $this->format = $formatType; 
    }
    public function getFormat(){ 
        print_r('Format: '.$this->format . '<br>'); 
    }
    public function setCategory($category){ 
        $this->category = str_getcsv($category);
    } 
    public function getCategory(){        
        print_r("Categories: " .implode(',',$this->category)."<br>");
    }
        
    public function setTags($tags){
        $this->tags = str_getcsv($tags);
    }
    public function getTags(){        
        print_r("Tags: ".implode(', ',$this->tags)."<br>");
    }

    public function setUrl($urlLink){ 
        $this->url = $urlLink; 
    }
    public function getUrl(){         
        print_r('<img src='.$this->url.' width="200"<br>');
    }
    //List bios page:
    public function getTitleLink(){
        $anchor = '<a href="show_biography.php?id='.$this->id.'">'.$this->title.'</a>';
        print_r($this->artist . ', '. $anchor . ' (' . $this->year .') -- ' . $this->format .'<br>');
    }

    public function setData($data_row){
        $this->setArtist($data_row[0]);
        $this->setLifeDates($data_row[1]);
        $this->setTitle($data_row[3]);
        $this->setYear($data_row[5]);
        $this->setAuthor($data_row[6]);
        $this->setFormat($data_row[7]);        
        $this->setCategory($data_row[4]);
        $this->setTags($data_row[2]);
        $this->setUrl($data_row[8]);
    }

    public function getData(){
        $this->getArtist();
        $this->getLifeDates();
        $this->getTitle();
        $this->getYear();
        $this->getAuthor();
        $this->getFormat();        
        $this->getCategory();
        $this->getTags();
        $this->getUrl();
    }

    public function save(){
        global $pdo;
         
        try{
            //'Artist' Table:
            $select_artist = $pdo->prepare("SELECT artist.id FROM artist WHERE name = ?");            
            $artist_insert = $pdo->prepare("INSERT INTO artist (name, life_dates) VALUES (?, ?)");                      
            $select_artist->execute([$this->artist]);            
            $existing_artist = $select_artist->fetch();            
                if(!$existing_artist){                    
                    $db_artist = $artist_insert->execute([$this->artist, $this->lifedates]);                    
                    $artist_id = $pdo->lastInsertID();                    
                } else {
                    $artist_id = $existing_artist['id'];
                }
            print_r("--Saved artist: ".$this->artist. " to the database.--<br>\n");                       

            //'Format' Table:
            $select_format = $pdo->prepare("SELECT format.id FROM format WHERE name = ?");
            $format_insert = $pdo->prepare("INSERT INTO format (name) VALUES (?)");            
            $select_format->execute([$this->format]);
            $existing_format = $select_format->fetch();
                if(!$existing_format){
                    $db_format = $format_insert->execute([$this->format]);
                    $format_id = $pdo->lastInsertID();                    
                } else {
                    $format_id = $existing_format['id'];
                }
            print_r("--Saved ".$this->format. " format to the database.--<br>\n");
            
            //'Biography' Table:
            $bio_insert = $pdo->prepare("INSERT INTO biography (artist_id, title, year, author_director, format_id, categories, image_url)
                                            VALUES (?, ?, ?, ?, ?, ?, ?)");
            $db_bio = $bio_insert->execute([$artist_id, $this->title, $this->year, $this->author, $format_id, implode(',', $this->category), $this->url]);
            $this->id = $pdo->lastInsertId();
            print_r("--Saved title: ".$this->title. " to the database.--<br>\n");
                                   
            //'Tag' Table: TAGS ARE STILL DUPLICATING WHEN LINKING TO A NEW AND EXISTING ARTIST???
            $select_tag = $pdo->prepare("SELECT tag.id FROM tag WHERE name = ?"); 
            $tag_insert = $pdo->prepare("INSERT INTO tag (name) VALUES (?)");
            // $select_tag_link = $pdo->prepare("SELECT tag.id FROM tag, artist_tag, artist 
            //                                 WHERE tag.name = ? AND tag.id = artist_tag.tag_id AND
            //                                 artist_tag.artist_id = artist.id");//ADDED NEW STATEMENT TO FIND EXISTING LINKS TO ARTISTS? didn't work...
            $tag_link = $pdo->prepare("INSERT INTO artist_tag (artist_id, tag_id) VALUES (?, ?)");

            for($i=0; $i<count($this->tags); $i++){
                $select_tag->execute([$this->tags[$i]]);
                $existing_tag = $select_tag->fetch();
                if(!$existing_tag){
                    $db_tag = $tag_insert->execute([$this->tags[$i]]);
                    $tag_id = $pdo->lastInsertID();                    
                } else {
                    $tag_id = $existing_tag['id'];
                }
                $tag_link->execute([$artist_id, $tag_id]);
                print_r("Connected tag: ".$this->tags[$i]." to ".$this->artist."<br>\n");

                // $select_tag_link->execute([$this->tags[$i]]); //TRIED ADDING NEW STATEMENT HERE to find existing artist link? DIDN'T MAKE ANY DIFFERENCE...
                // $existing_tag_link = $select_tag_link->fetch();
                // if(!$existing_tag_link){
                //     $tag_link->execute([$artist_id, $tag_id]); //MOVED EXISTING link STATEMENT HERE                                
                //     $tag_id = $pdo->lastInsertID();
                // } else {
                //     $tag_id = $existing_tag_link['id'];
                //     }                        
                // print_r("Connected tag: ".$this->tags[$i]." to ".$this->artist."<br>\n");                                
            }
            flush();
            ob_flush();
        } catch (PDOException $e){
            print_r("Error saving bio to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    //LOAD INDIVIDUAL BIOGRAPHY: UPDATE AFTER FIXING SECTION BELOW
    static public function load_by_id($id){
        global $pdo;

        try{
            $find_biography = $pdo->prepare("SELECT biography.*, artist.* FROM biography, artist WHERE biography.id = ?");

            $select_artistName = $pdo->prepare("SELECT artist.name FROM artist, biography 
                                            WHERE biography.artist_id = ? AND biography.artist_id = artist.id");

            $select_lifeDates = $pdo->prepare("SELECT artist.life_dates AS life_dates FROM artist, biography
                                            WHERE biography.artist_id = ? AND biography.artist_id = artist.id");
            
            $select_tags = $pdo->prepare("SELECT tag.name AS tags FROM tag, artist_tag, artist, biography 
                                        WHERE artist_tag.tag_id = ? AND tag.id = artist_tag.tag_id
                                        AND artist_tag.artist_id = artist.id AND artist.id = biography.artist_id");    

            $find_biography->execute([$id]);
            $db_biography = $find_biography->fetch();
            if(!$db_biography){
                return false;        
            } else {
                $biography = new Biography();//empty object
                $biography->setArtist($db_biography['artist_id']);//only showing artist_id number, not name
                $biography->setLifeDates($db_biography['life_dates']);//this comes from artist_table; showing same life dates?
                $biography->setTitle($db_biography['title']);
                $biography->setYear($db_biography['year']);
                $biography->setAuthor($db_biography['author_director']);
                $biography->setFormat($db_biography['format_id']);//only showing format_id number, not name
                $biography->setCategory($db_biography['categories']);
                $biography->setUrl($db_biography['image_url']);
                $biography->setID($id);//database ID
                
                $select_artistName->execute([$id]);                       
                $db_artist = $select_artistName->fetch();

                $select_lifeDates->execute([$id]);
                $db_lifeDates = $select_lifeDates->fetch();
                
                // $select_format->execute([$id]);
                // $db_format = $select_format->fetch();
                
                $select_tags->execute([$id]);
                $db_tags = $select_tags->fetchAll();
                $tags = array();
                for($j=0; $j<count($db_tags); $j++){
                    array_push($tags, $db_tags[$j]['tags']);
                    }
                $biography->setTags(implode(',', $tags));
                return $biography;                
            }

        } catch (PDOException $e){
            print_r("Error reading single biography from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }


    //SHOWING DATABASE RESULTS:
    static public function load(){
        global $pdo;

        $bios = array();

        try{
            //if($tag==false){
            
            //Searches biography table & one-to-many foreign keys: 
            $select_bios = $pdo->prepare("SELECT biography.*, artist.name AS artist_id, artist.life_dates AS life_dates, 
                                        format.name AS format_id FROM biography, artist, format 
                                        WHERE biography.artist_id = artist.id 
                                        AND biography.format_id = format.id 
                                        ORDER BY artist.name ASC");            
            $select_bios->execute();
            
            // } else {
            //     $select_bios = $pdo->prepare("SELECT biography.*, artist.name, tag.name FROM biography, artist, artist_tag, tag 
            //                                 WHERE biography.artist_id = artist.id AND artist.id = artist_tag.artist_id
            //                                 AND artist_tag.tag_id = tag.id AND tag.id = ?");//this appears to need some work
            //     $select_bios->execute([$tag]); 
            // }            
            
            //Search for tags connected to artist by artist_tags lookup table: WORKS! -- search for what artist it's connected to!
            $select_tags = $pdo->prepare("SELECT tag.name AS tags FROM tag, artist_tag 
                                        WHERE artist_tag.tag_id = tag.id AND artist_tag.artist_id = ?"); 
                                        
            $db_bios = $select_bios->fetchAll();//put results in a variable, and fetch all of the results in an array                                                     

            for($i=0; $i<count($db_bios); $i++){
                $biography = new Biography();
                $biography->setArtist($db_bios[$i]['artist_id']);
                $biography->setLifeDates($db_bios[$i]['life_dates']);
                $biography->setTitle($db_bios[$i]['title']);
                $biography->setYear($db_bios[$i]['year']);
                $biography->setAuthor($db_bios[$i]['author_director']);
                $biography->setFormat($db_bios[$i]['format_id']);
                $biography->setCategory($db_bios[$i]['categories']);
                $biography->setUrl($db_bios[$i]['image_url']);
                $biography->setID($db_bios[$i]['id']);           

                $select_tags->execute([$biography->id]);
                $db_tags = $select_tags->fetchAll();
                $tags = array();
                for($j=0; $j<count($db_tags); $j++){
                    array_push($tags, $db_tags[$j]['tags']);
                }
                $biography->setTags(implode(',', $tags));
                array_push($bios, $biography);
            }
            return $bios;            
        } catch (PDOException $e){
            print_r("Error reading biography from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }
}
?>
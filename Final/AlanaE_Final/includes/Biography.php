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
        print_r( 'Artist: '.$this->artist . '<br>'); 
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
        print_r("<b>Title: ".$this->title . "</b><br>"); 
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
        for($j=0; $j<count($this->category); $j++){
            print_r("<span style='color:red'>Categories: ".($j+1)." is ".$this->category[$j]."</span><br>");
        }
    }    
    public function setTags($tags){
        $this->tags = str_getcsv($tags);
    }
    public function getTags(){ 
        for($j=0; $j<count($this->tags); $j++){
            print_r("<span style='color:blue'>Tags: ".($j+1)." is ".$this->tags[$j]."</span><br>");
        }
    }
    public function setUrl($urlLink){ 
        $this->url = $urlLink; 
    }
    public function getUrl(){ 
        print_r('Image URL: '.$this->url . '<br>'); 
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
            $select_artist = $pdo->prepare("SELECT * FROM artist WHERE name = ?");
            $artist_insert = $pdo->prepare("INSERT INTO artist (name, life_dates) VALUES (?, ?)");

            $select_artist->execute([$this->artist]);
            $existing_artist = $select_artist->fetch();
                if(!$existing_artist){
                    $db_artist = $artist_insert->execute([$this->artist]);
                    $artist_id = $pdo->lastInsertID();
                } else {
                    $artist_id = $existing_artist['id'];
                }
            $db_artist = $artist_insert->execute([$this->artist, $this->lifedates]);
            $artist_id = $pdo->lastInsertId();
            print_r("--Saved ".$this->artist. "to the database.--<br>\n");
            
            //'Format' Table:
            $select_format = $pdo->prepare("SELECT * FROM format WHERE name = ?");
            $format_insert = $pdo->prepare("INSERT INTO format (name) VALUES (?)");
            
            $select_format->execute([$this->format]);
            $existing_format = $select_format->fetch();
                if(!$existing_format){
                    $db_format = $format_insert->execute([$this->format]);
                    $format_id = $pdo->lastInsertID();
                } else {
                    $format_id = $existing_format['id'];
                }
            $db_format = $format_insert->execute([$this->format]);
            $format_id = $pdo->lastInsertId();
            print_r("--Saved ".$this->format. "to the database.--<br>\n");
            
            //'Biography' Table:
            $bio_insert = $pdo->prepare("INSERT INTO biography (artist_id, title, year, author_director, format_id, categories, image_url)
                                            VALUES (?, ?, ?, ?, ?, ?, ?)");
            $db_bio = $bio_insert->execute([$artist_id, $this->title, $this->year, $this->author, $format_id, implode(',', $this->category), $this->url]);
            $bio_id = $pdo->lastInsertId();//ADJUST $THIS->ID TO $BIO->ID?
            print_r("--Saved ".$this->title. "to the database.--<br>\n");
            
            //'Tag' Table:
            $select_tag = $pdo->prepare("SELECT * FROM tag WHERE name = ?");
            $tag_insert = $pdo->prepare("INSERT INTO tag (name) VALUES (?)");
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
                print_r("Connected ".$this->tags[$i]." to".$this->artist."<br>\n");
            }
            flush();
            ob_flush();
        } catch (PDOException $e){
            print_r("Error saving to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    //SHOWING DATABASE RESULTS: create SQL scripts...this section pulls data back out of the database to display on the page
    static public function load(){
        global $pdo;

        $bios = array();

        try{
            $select_bios = $pdo->prepare("SELECT * FROM biography ORDER BY title ASC");
            $select_bios->execute();
                            
            //I think I need to write SELECT statements for all of the foreign key relationships?
            $select_artist = $pdo->prepare("SELECT artist.name FROM artist, biography 
                                            WHERE artist.id = ? AND artist.id = biography.artist_id 
                                            ORDER BY artist.name ASC");            

            $db_bios = $select_bios->fetchAll();//put results in a variable, and fetch all of the results in an array

            for($i=0; $i<count($db_bios); $i++){
                $biography = new Biography();//empty object
                $biography->setArtist($db_bios[$i]['artist']);//call each of the set functions
                $biography->setLifeDates($db_bios[$i]['lifeDates']);
                $biography->setTitle($db_bios[$i]['title']);
                $biography->setYear($db_bios[$i]['year']);
                $biography->setAuthor($db_bios[$i]['author']);
                $biography->setFormat($db_bios[$i]['format']);
                $biography->setCategory($db_bios[$i]['category']);
                $biography->setUrl($db_bios[$i]['url']);
                $biography->setID($db_bios[$i]['id']);//database ID

                //select artist from lookup table associated with Biography table:
                $select_artist->execute([$biography->id]);//???--I don't understand this part. And is it not setting properly?--
                $db_artist = $select_artist->fetchAll();
                $artists = array();//is this necessary?
                array_push($artists, $db_artists[$j]['name']);
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
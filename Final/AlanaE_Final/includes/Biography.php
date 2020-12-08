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
    public function setArtist($artistName){ $this->artist = $artistName; }
    public function getArtist(){ print_r( 'Artist: '.$this->artist . '<br>'); }
    public function setLifeDates($lifeDates){ $this->lifedates = $lifeDates; }
    public function getLifeDates(){ print_r( 'Life Dates: '.$this->lifedates . '<br>'); }
    public function setTitle($titleName){ $this->title = $titleName; }
    public function getTitle(){ print_r("<b>Title: ".$this->title . "</b><br>"); }
    public function setYear($releaseYear){ $this->year = $releaseYear; }
    public function getYear(){ print_r('Year: '.$this->year . '<br>'); }
    public function setAuthor($authorName){ $this->author = $authorName; }
    public function getAuthor(){ print_r('Author/Director: '.$this->author . '<br>'); }
    public function setFormat($formatType){ $this->format = $formatType; }
    public function getFormat(){ print_r('Format: '.$this->format . '<br>'); }
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
    public function setUrl($urlLink){ $this->url = $urlLink; }
    public function getUrl(){ print_r('Image URL: '.$this->url . '<br>'); }
    
    //->setData runs all the setX methods
    //$data_row is a single row of data from the csv passed as an array. Mappings are below.
    public function setData($data_row){
        // mapping of data_row:    artist=0
                                // lifedates=1
                                // title=3
                                // year=5
                                // author=6
                                // format=7
                                // category=4
                                // tags=2
                                // url=8
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

    //->getData runs all the getX methods (which print out the data for each property)
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
            $bio_insert = $pdo->prepare("INSERT INTO artist (name, life_dates) VALUES (?, ?)");
            //add 'for' loop similar to tag loop below to prevent duplicate artists?    
            $db_bio = $bio_insert->execute([$this->artist, $this->lifedates]);
            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->artist to the database.--<br>\n");

            $bio_insert = $pdo->prepare("INSERT INTO format (name) VALUES (?)");
            $db_bio = $bio_insert->execute([$this->format]);
            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->format to the database.--<br>\n");
            //how do I link format_id foreign key to biography table?
            
            $bio_insert = $pdo->prepare("INSERT INTO biography (artist_id, title, year, author_director, format_id, categories, image_url)
                                            VALUES (?, ?, ?, ?, ?, ?, ?)");//probably need to adjust these INSERTS for the 2 foreign ids
            $db_bio = $bio_insert->execute([$this->artist, $this->title, $this->year, $this->author, $this->format, implode(',', $this->category), $this->url]);
            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->title to the database.--<br>\n");

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
                $tag_link->execute([$this->id, $tag_id]);
                print_r("Connected ".$this->tags[$i]." to $this->artist<br>\n");
            }
            flush();
            ob_flush();
        } catch (PDOException $e){
            print_r("Error saving biography to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load($tags=false){
        global $pdo;

        $bios = array();
        try{
            if($tags==false){
                $select_artist = $pdo->prepare("SELECT * FROM artist ORDER BY name ASC");
                $select_artist->execute();
            } else {//but tags are linked to artist, NOT biography -- restart
                $select_artist = $pdo->prepare("SELECT artist.* FROM artist, artist_tag, tag
                                                WHERE tag.id = artist_tag.artist_id AND
                                                  artist_tag.tag_id = tag.id AND
                                                  tag.name = ?
                                                ORDER BY artist.name ASC");
                $select_artist->execute([$tags]);
            }
            
            $select_tags = $pdo->prepare("SELECT tag.name AS name
                                            FROM artist_tag, tag
                                            WHERE artist_tag.artist_id = ?
                                              AND artist_tag.tag_id = tag.id");


            $db_artist = $select_artist->fetchAll();

            for($i=0; $i<count($db_bio); $i++){
                $biography = new Biography();
                $biography->setArtist($db_bio[$i]['artist']);
                $biography->setLifeDates($db_bio[$i]['lifeDates']);
                $biography->setTitle($db_bio[$i]['title']);
                $biography->setYear($db_bio[$i]['year']);
                $biography->setAuthor($db_bio[$i]['author']);
                $biography->setFormat($db_bio[$i]['format']);
                $biography->setCategory($db_bio[$i]['category']);
                $biography->setUrl($db_bio[$i]['url']);
                $biography->setID($db_bio[$i]['id']);

                $select_artist->execute([$artist->id]);//executes tag query defined above
                $db_tags = $select_tag->fetchAll();
                $tags = array();
                for($j=0; $j<count($db_tags); $j++){
                    array_push($tags, $db_tags[$j]['name']);
                }
                $artist->setTags(implode(',', $tags));
                array_push($bios, $biography);//this looks wrong...readjust
            }
            return $bios;
        } catch (PDOException $e){
            print_r("Error reading album from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }
}
?>
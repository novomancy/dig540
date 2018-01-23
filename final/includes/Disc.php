<?php
class Album{
    private $id;
    private $title;
    private $year;
    private $artist_id;
    private $artist;
    private $composer_id;
    private $composer;
    private $image_url;
  
    public function setID($id){
        $this->id = $id; }
    public function getID(){ 
        print_r('ID: '.$this->id . '<br>'); }

    public function setTitle($title){ 
        $this->title = $title;}
    public function getTitle(){ 
        print_r('Title: '.$this->title . '<br>'); }

    public function setYear($year){ 
        $this->year = $year; }
    public function getYear(){ 
        print_r('Year: '.$this->year . '<br>'); } 

    public function setArtistID($artist_id){ 
        $this->artist_id = $artist_id; }
    public function getArtistID(){ 
         print_r('ArtistID:'.$this->artist_id . '<br>'); }

    public function setArtist($artist){ 
         $this->artist = $artist; }
    public function getArtist(){ 
        print_r('Artist:'.$this->artist . '<br>'); }

    public function setComposerID($composer_id){ 
        $this->composer_id = str_getcsv($composer_id); }
    public function getComposerID(){ 
        print_r('ComposerID:'.$this->composer_id . '<br>'); }

    public function setComposer($composer){ 
        $this->composer = str_getcsv($composer); } 
    public function getComposer(){
        for($j=0; $j<count($this->composer); $j++){
          print_r('<a href="List_discs.php?composer='.$this->composer[$j].'">Composer # '.($j+1).' is ' .$this->composer[$j].'</a><br>');
        }
    }
    public function setImageURL($image_url){ 
        $this->image_url = $image_url;}
    public function getImageURL(){ 
        print_r('ImageURL: <img src="'.$this->image_url . '"><br>');
        // print_r('<a href="ImageURL: <img src="'.$this->id.'">'.$this->image_url .' </a><br>');
    }   

    public function getTitleLink(){
        $anchor = '<a href="show_disc.php?id='.$this->id.'">' .$this->title. '</a>';
        print_r($this->id .': '. $anchor . 'by' . $this->artist . '<br>');
    }

    public function setData($data_row){
        $this->setID($data_row[0]);
        $this->setTitle($data_row[1]);
        $this->setYear($data_row[2]);
        $this->setArtistID($data_row[3]);
        $this->setArtist($data_row[4]);
        $this->setComposer($data_row[6]);
        $this->setImageURL($data_row[7]);
    }
    
    public function getData(){
        $this->getID();
        $this->getTitle();
        $this->getYear();
        $this->getArtistID();
        $this->getArtist();
        $this->getComposer();
        $this->getImageURL();
        $this->getTitleLink();
    }

    public function save(){
        global $pdo;

        try{


            $select_composer = $pdo->prepare("SELECT * FROM composer WHERE name = ?");
            $composer_insert = $pdo->prepare("INSERT INTO composer (name) VALUES (?)");
            $select_artist = $pdo->prepare("SELECT * FROM artist WHERE name = ?");
            $artist_insert = $pdo->prepare("INSERT INTO artist (name) VALUES (?)");
            $composer_link = $pdo->prepare("INSERT INTO album_composer (album_id, composer_id) VALUES (?, ?)");

            $select_artist->execute([$this->artist]);
            $existing_artist = $select_artist->fetch();
            if (!$existing_artist){
                $db_artist = $artist_insert->execute([$this->artist]);
                $artist_id = $pdo->lastInsertID();
                
            } else {
                $artist_id = $existing_artist['id'];
            }

            $album_insert = $pdo->prepare("INSERT INTO album (title, year, artist_id, image_url)
                        VALUES (? ,?, ?, ?)");
            $db_album = $album_insert->execute([$this->title, $this->year, $artist_id, $this->image_url]);
            $this->id = $pdo->lastInsertID();
            print_r("--Saved $this->title to the database.--<br>\n");   

            for($i=0; $i<count($this->composer); $i++){
                print_r("Composers....");
                print_r($this->composer[$i]);
                $select_composer->execute([$this->composer[$i]]);
                $existing_composer = $select_composer->fetch();
                if (!$existing_composer){
                    $db_composer = $composer_insert->execute([$this->composer[$i]]);
                    $composer_id = $pdo->lastInsertID();
                    
                } else {
                    $composer_id = $existing_composer['id'];
                }
                $composer_link->execute([$this->id, $composer_id]);
                print_r("Connected" . $this->composer[$i]."to $this->title<br>\n");
            }
            flush();
            ob_flush();

        } catch (PDOException $e){
            print_r("Error saving album to database: ".$e->getMessage() ."<br>\n");
            exit;}
    }

    static public function load_by_id($id){
        global $pdo;

        try{
            $find_album = $pdo->prepare("SELECT album.*, artist.name AS artist FROM album, artist
                                        WHERE album.artist_id = artist.id AND album.id = ?");
            $select_composer = $pdo->prepare("SELECT composer.name AS 'name'
                                              FROM album_composer, composer
                                              WHERE album_composer.album_id = ?
                                              AND album_composer.composer_id = composer.id");
            $find_album->execute([$id]);
            $db_album = $find_album->fetch();
            if(!$db_album){
                return false;
            } else{
                $album = new Album();
                $album->setID($db_album['id']);
                $album->setTitle($db_album['title']);
                $album->setYear($db_album['year']);
                $album->setArtistID($db_album['artist_id']);
                $album->setArtist($db_album['artist']);
                $album->setImageURL($db_album['image_url']);

                $select_composer->execute([$album->id]);
                $db_composer = $select_composer->fetchAll();
                $composer = array();
                for($j=0; $j<count($db_composer); $j++){
                    array_push($composer, $db_composer[$j]['name']);
                }
                $album->setComposer(implode(',', $composer));
                return $album;
            }
        }catch(PDOException $e){
            print_r("Error reading single album from database: ".$e->getMessage() ."<br>\n");
            exit;}
            
        }

    static public function load($composer=false){
         global $pdo;

        $albums = array();
        try{
            if($composer==false){
                $select_albums = $pdo->prepare("SELECT album.*, artist.name AS artist
                                                FROM album, artist 
                                                WHERE album.artist_id = artist.id
                                                ORDER BY id ASC");
                                               
                $select_albums->execute();
            } else {
                $select_albums = $pdo->prepare("SELECT album.*, artist.name AS artist FROM album, album_composer, composer, artist
                                                WHERE album.id = album_composer.album_id AND
                                                 album_composer.composer_id = composer.id AND
                                                composer.name = ?
                                                AND album.artist_id = artist.id
                                                ORDER BY album.id ASC");
                // $select_albums = $pdo->prepare("SELECT album.* FROM album, album_composer, composer
                //                                 WHERE album.id = album_composer.album_id AND
                //                                  album_composer.composer_id = composer.id AND
                //                                  composer.name =?
                //                                  ORDER BY album.id ASC");

                $select_albums->execute([$composer]);
            }

            $select_composer = $pdo->prepare("SELECT composer.name AS 'name'
                                            FROM album_composer, composer
                                            WHERE album_composer.album_id = ?
                                            AND album_composer.composer_id = composer.id");

            $db_albums = $select_albums->fetchALL();

            for($i=0; $i<count($db_albums); $i++){
                $album = new Album();
                $album->setID($db_albums[$i]['id']);
                $album->setTitle($db_albums[$i]['title']);
                $album->setYear($db_albums[$i]['year']);
                $album->setArtistID($db_albums[$i]['artist_id']);
                $album->setArtist($db_albums[$i]['artist']);
                $album->setImageURL($db_albums[$i]['image_url']);

                $select_composer->execute([$album->id]);
                $db_composer = $select_composer->fetchAll();
            
                $composers = array();
                for($j=0; $j<count($db_composer); $j++){
                    array_push($composers, $db_composer[$j]['name']);
                }

                $album->setComposer(implode(',', $composers));
                array_push($albums, $album);
            }
            return $albums;
        } catch (PDOException $e){
            print_r("Error reading album from database: ".$e->getMessage() ."<br>\n");
            exit;}
        }
    }    
?>

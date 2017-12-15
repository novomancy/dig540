<?php
 class Album{
     private $ID;
     private $Title;
     private $Year;
     private $Artist_id;
     private $Artist;
     private $Composer_id;
     private $Composer;
     private $Image_url;
     private $db_id;

     public function setdbID($dbID){
         $this->dbID = $dbID;
     }
     
     public function setID($idNumber){
        $this->ID = $idNumber;
     }
     public function getID(){ 
        print_r( 'ID: '.$this->id . '<br>'); 
     }
     public function setTitle($titleName){ 
        $this->Title = $titleName; 
     }
     public function getTitle(){ 
        print_r('Title: '.$this->Title . '<br>'); 
     }
     public function setYear($releaseYear){ 
        $this->Year = $releaseYear; 
     }
     public function getYear(){ 
        print_r('Year: '.$this->Year . '<br>');
     } 
     public function setArtistID($artistNumber){ 
        $this->ArtistID = $artistNumber;
     }
     public function getArtistID(){ 
         print_r('ArtistID:'.$this->ArtistID . '<br>');
     }
     public function setArtist($artist){ 
         $this->Artist = $artist;
     }
     public function getArtist(){ 
        print_r('Artist:'.$this->Artist . '<br>');
     }
     public function setComposerID($composerNumber){ 
        $this->ComposerID = str_getcsv($composerNumber);
     }
     public function getComposerID(){ 
        print_r('ComposerID:'.$this->ComposerID . '<br>');
     }
     public function setComposer($composer){ 
        $this->Composer = str_getcsv($composer);
     } 
     public function getComposer(){  
        print_r('Composer:'.$this->Composer . '<br>'); 
     }
     public function setImageURL($imageURL){ 
        $this->ImageURL = $imageURL;
     }
     public function getImageURL(){ 
        print_r('ImageURL:'.$this->ImageURL . '<br>');
     }   
     public function setData($data_row){
        $this->setID($data_row[0]);
        $this->setTitle($data_row[1]);
        $this->setYear($data_row[2]);
        $this->setArtistID($data_row[3]);
        $this->setArtist($data_row[4]);
        $this->setImageURL($data_row[7]);
           
     }
     public function getData(){
        $this->getID();
        $this->getTitle();
        $this->getYear();
        $this->getArtistID();
        $this->getArtist();;
        $this->getImageURL();
     }

     public function save(){
        global $pdo;

        try{
            $album_insert = $pdo->prepare("INSERT INTO album (ID, Title, Year, Artist_ID, Artist, ImageURL)
                                            VALUES (?, ?, ? ,?, ?, ?)");
            $db_album = $album_insert->execute([$this->ID, $this->Title, $this->Year, $this->ArtistID, $this->Artist, $this->imageURL]);
            $this->ID = $pdo->lastInsertID();
            print_r("--Saved this title to the database--". "<br>\n");

            $select_Composer = $pdo->prepare("SELECT * FROM composer WHERE name = ?");
            $Composer_insert = $pdo->prepare("INSERT INTO composer (name) VALUES (?)");
            $Composer_link = $pdo->prepare("INSERT INTO album-composer (album_id, composer_id) VALUES (?, ?)");

            for($i=0; $i<count($this->Composer); $i++){
                $select_Composer->execute($this_Composer[$i]);
                $existing_Composer = $select_Composer->fetch();
                if (!$existing_Composer){
                    $db_composer = $Composer_insert->execute([$this->Composer[$i]]);
                    $Composer_id = $pdo->lastInsertID();
                    $Composer_id = $existing_Composer['id'];
                }
                $Composer_link->execute([$this->id], $Composer_id);
                print_r("Connected" . $this->Composer[$i]."to$this->Title<br>\n");
            }
            flush();
            ob_flush();

        } catch (PDOException $e){
            print_r("Error saving album to database: ".$e->getMessage() ."<br>\n");
            exit;

        }
     }

     static public function load($composer=false){
         global $pdo;

        $albums = array();
        try{
            if($composer=false){
                $select_albums = $pdo->prepare("SELECT * FROM album ORDER BY id ASC");
                $select_albums->execute();
            } else {
                $select_albums = $pdo->prepare("SELECT album.* FROM album, album_composer, composer
                                                WHERE album.id = album_composer.album_id AND
                                                 album_composer.composer_id = composer.id AND
                                                 composer.name =?
                                                 ORDER BY album.id ASC");
                $select_albums->execute([$composer]);
            }
            $select_Composer = $pdo->prepare("SELECT composer.name AS 'name'
                                            FROM album_composer, composer
                                            WHERE album_composer.album_id = ?
                                            AND album_composer.composer_id = composer_id");

            $db_albums = $select_albums->fetchALL();

            for($i=0; $i<count($db_albums); $i++){
                $album = new Album();
                $album->setID($db_albums[$i] ['ID']);
                $album->setTitle($db_albums[$i] ['Title']);
                $album->setYear($db_albums[$i] ['Year']);
                $album->setArtistID($db_albums[$i] ['ArtistID']);
                $album->setArtist($db_albums[$i] ['Artist']);
                $album->setImageURL($db_albums[$i] ['ImageURL']);
                $album->setdbID($db_albums[$i] ['dbID']);

                $select_composer->execute([$album->dbID]);
                $db_composers = $select_composer->fetchALL();
                $composers = array();
                for($j=0; $j<count($db_composers); $j++){
                    array_push($composers, $db_composers, ['name']);
                }
                $albums->setComposer(implode(',', $composers));
                array_push($albums, $album);
            }
            return $albums;
        } catch (PDOException $e){
            print_r("Error reading album from database: ".$e->getMessage() ."<br>\n");
            exit;

        }
     }
 }
?>

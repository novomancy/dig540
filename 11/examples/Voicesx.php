<?php
class Voices{
    private $rank;
    private $title;
    private $year;
    private $permission;
    private $subject;
    private $contributor;
    private $genre;
    private $id;

    public function setID($dbID){ $this->id = $dbID; }
    public function setRank($rankNumber){ $this->rank = $rankNumber; }
    public function getRank(){ print_r('Rank: '.$this->rank . '<br>'); }
    public function setTitle($titleName){ $this->title = $titleName; }
    public function getTitle(){ print_r('Title: '.$this->title . '<br>'); }
    public function setYear($releaseYear){ $this->year = $releaseYear; }
    public function getYear(){ print_r('Year: '.$this->year . '<br>'); }
    public function setPermission($permission){ $this->permission = $permission; }
    public function getPermission(){ print_r( 'Permission: '.$this->permission . '<br>'); }
    public function setSubject($subject){ $this->subject = $subject; }
    public function getSubject(){ print_r('Title: '.$this->subject . '<br>'); }

    
    public function setGenre($genre){ 
        $this->genre = str_getcsv($genre);
    }
    public function getGenre(){ 
        for($j=0; $j<count($this->genre); $j++){
            print_r('<a href="list_albums.php?genre='.$this->genre[$j].'">Genre #'.($j+1).' is '.$this->genre[$j].'</a><br>');
        }
    }
    public function setContributor($contributor){ 
        $this->contributor = str_getcsv($contributor);
    }
    public function getContributor(){ 
        for($j=0; $j<count($this->contributor); $j++){
            print_r('<a href="list_albums.php?contributor='.$this->contributor[$j].'">Contributor #'.($j+1).' is '.$this->contributor[$j].'</a><br>');
        }
    }
    public function setSubject($subject){ 
        $this->subject = str_getcsv($subject);
    }
    public function getSubject(){ 
        for($j=0; $j<count($this->subject); $j++){
            print_r("Subgenre #".($j+1)." is ".$this->subject[$j]."<br>");
        }
    }
    public function getTitleLink(){
        $anchor = '<a href="show_album.php?id='.$this->id.'">'.$this->title.'</a>';
        print_r($this->rank . ': '. $anchor . ' by ' . $this->artist . '<br>');
    }

    //->setData runs all the setX methods
    //$data_row is a single row of data from the csv passed as an array. Mappings are below.
    public function setData($data_row){
        // mapping of data_row:    artist=3
        //                         title=2
        //                         rank=0
        //                         year=1
        //                         genre=4
        //                         subgenre=5
        $this->setPermission($data_row[3]);
        $this->setTitle($data_row[1]);
        $this->setRank($data_row[0]);
        $this->setYear($data_row[2]);
        $this->setSubject($data_row[4]);
        $this->setGenre($data_row[5]);
        $this->setContributor($data_row[6]);
    }

    //->getData runs all the getX methods (which print out the data for each property)
    public function getData(){
        $this->getTitle();
        $this->getRank();
        $this->getYear();
        $this->getSubject();
        $this->getGenre();
        $this->getContributor();
    }

    public function save(){
        global $pdo;

        try{
            $album_insert = $pdo->prepare("INSERT INTO voices (number, year, title, subject)
                                            VALUES (?, ?, ?, ?)");
            $db_album = $album_insert->execute([$this->rank, $this->year, $this->title, implode(',', $this->subject)]);
            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->title to the database.--<br>\n");

            $select_genre = $pdo->prepare("SELECT * FROM genre WHERE name = ?");
            $genre_insert = $pdo->prepare("INSERT INTO genre (name) VALUES (?)");
            $genre_link = $pdo->prepare("INSERT INTO album_genre (album_id, genre_id) VALUES (?, ?)");

            for($i=0; $i<count($this->genre); $i++){
                $select_genre->execute([$this->genre[$i]]);
                $existing_genre = $select_genre->fetch();
                if(!$existing_genre){
                    $db_genre = $genre_insert->execute([$this->genre[$i]]);
                    $genre_id = $pdo->lastInsertID();
                } else {
                    $genre_id = $existing_genre['id'];
                }
                $genre_link->execute([$this->id, $genre_id]);
                print_r("Connected ".$this->genre[$i]." to $this->title<br>\n");
            }
            flush();
            ob_flush();
        } catch (PDOException $e){
            print_r("Error saving album to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load_by_id($id){
        global $pdo;

        try{
            $find_recording = $pdo->prepare("SELECT * FROM album
                                            WHERE id = ?");
            $select_genre = $pdo->prepare("SELECT genre.name AS name
                                                FROM album_genre, genre
                                                WHERE album_genre.album_id = ?
                                                AND album_genre.genre_id = genre.id");
            $find_album->execute([$id]);
            $db_album = $find_album->fetch();
            if(!$db_album){
                return false;
            } else {
                $album = new Album();
                $album->setTitle($db_album['title']);
                $album->setYear($db_album['year']);
                $album->setRank($db_album['number']);
                $album->setArtist($db_album['artist']);
                $album->setSubgenres($db_album['subgenre']);
                $album->setID($id);

                $select_genre->execute([$id]);
                $db_genres = $select_genre->fetchAll();
                $genres = array();
                for($j=0; $j<count($db_genres); $j++){
                    array_push($genres, $db_genres[$j]['name']);
                }
                $album->setGenres(implode(',', $genres));
                return $album;                
            }
        } catch (PDOException $e){
            print_r("Error reading single album from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

   
}
?>
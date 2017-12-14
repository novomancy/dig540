<?php
class Album{
    private $ID;
    private $title;
    private $ID;
    private $;
    private $genres;
    private $subgenres;
    private $id;

    public function setID($dbID){ $this->id = $dbID; }
    public function setArtist($artistName){ $this->artist = $artistName; }
    public function getArtist(){ print_r( 'Artist: '.$this->artist . '<br>'); }
    public function setTitle($titleName){ $this->title = $titleName; }
    public function getTitle(){ print_r('Title: '.$this->title . '<br>'); }
    public function setRank($rankNumber){ $this->rank = $rankNumber; }
    public function getRank(){ print_r('Rank: '.$this->rank . '<br>'); }
    public function setYear($releaseYear){ $this->year = $releaseYear; }
    public function getYear(){ print_r('Year: '.$this->year . '<br>'); }
    public function setGenres($genres){ 
        $this->genres = str_getcsv($genres);
    }
    public function getGenres(){ 
        for($j=0; $j<count($this->genres); $j++){
            if($j%2==0) print_r("<span style='color:blue'>Genre #".($j+1)." is ".$this->genres[$j]."</span><br>");
            else print_r("<span style='color:red'>Genre #".($j+1)." is ".$this->genres[$j]."</span><br>");
        }
    }
    public function setSubgenres($subs){ 
        $this->subgenres = str_getcsv($subs);
    }
    public function getSubgenres(){ 
        for($j=0; $j<count($this->subgenres); $j++){
            if($j%2==0) print_r("<span style='color:blue'>Subgenre #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
            else print_r("<span style='color:red'>Subgenre #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
        }
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
        $this->setArtist($data_row[3]);
        $this->setTitle($data_row[2]);
        $this->setRank($data_row[0]);
        $this->setYear($data_row[1]);
        $this->setGenres($data_row[4]);
        $this->setSubgenres($data_row[5]);
    }

    //->getData runs all the getX methods (which print out the data for each property)
    public function getData(){
        $this->getTitle();
        $this->getYear();
        $this->getRank();
        $this->getArtist();
        $this->getGenres();
        $this->getSubgenres();
    }

    public function save(){
        global $pdo;

        try{
            $album_insert = $pdo->prepare("INSERT INTO album (number, year, title, artist, subgenre)
                                            VALUES (?, ?, ?, ?, ?)");
            $db_album = $album_insert->execute([$this->rank, $this->year, $this->title, $this->artist, implode(',', $this->subgenres)]);
            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->title to the database.--<br>\n");

            $select_genre = $pdo->prepare("SELECT * FROM genre WHERE name = ?");
            $genre_insert = $pdo->prepare("INSERT INTO genre (name) VALUES (?)");
            $genre_link = $pdo->prepare("INSERT INTO album_genre (album_id, genre_id) VALUES (?, ?)");

            for($i=0; $i<count($this->genres); $i++){
                $select_genre->execute([$this->genres[$i]]);
                $existing_genre = $select_genre->fetch();
                if(!$existing_genre){
                    $db_genre = $genre_insert->execute([$this->genres[$i]]);
                    $genre_id = $pdo->lastInsertID();
                } else {
                    $genre_id = $existing_genre['id'];
                }
                $genre_link->execute([$this->id, $genre_id]);
                print_r("Connected ".$this->genres[$i]." to $this->title<br>\n");
            }
            flush();
            ob_flush();
        } catch (PDOException $e){
            print_r("Error saving album to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load($genre=false){
        global $pdo;

        $albums = array();
        try{
            if($genre==false){
                $select_albums = $pdo->prepare("SELECT * FROM album ORDER BY number ASC");
                $select_albums->execute();
            } else {
                $select_albums = $pdo->prepare("SELECT album.* FROM album, album_genre, genre
                                                WHERE album.id = album_genre.album_id AND
                                                  album_genre.genre_id = genre.id AND
                                                  genre.name = ?
                                                ORDER BY album.number ASC");
                $select_albums->execute([$genre]);
            }
            
            $select_genre = $pdo->prepare("SELECT genre.name AS name
                                            FROM album_genre, genre
                                            WHERE album_genre.album_id = ?
                                              AND album_genre.genre_id = genre.id");


            $db_albums = $select_albums->fetchAll();

            for($i=0; $i<count($db_albums); $i++){
                $album = new Album();
                $album->setTitle($db_albums[$i]['title']);
                $album->setYear($db_albums[$i]['year']);
                $album->setRank($db_albums[$i]['number']);
                $album->setArtist($db_albums[$i]['artist']);
                $album->setSubgenres($db_albums[$i]['subgenre']);
                $album->setID($db_albums[$i]['id']);

                $select_genre->execute([$album->id]);
                $db_genres = $select_genre->fetchAll();
                $genres = array();
                for($j=0; $j<count($db_genres); $j++){
                    array_push($genres, $db_genres[$j]['name']);
                }
                $album->setGenres(implode(',', $genres));
                array_push($albums, $album);
            }
            return $albums;
        } catch (PDOException $e){
            print_r("Error reading album from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }
}
?>
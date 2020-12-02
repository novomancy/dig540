<?php

class Album{
    private $artist;
    private $title;
    private $rank;
    private $year;
    private $genres;
    private $subgenres;
    private $id;//this is for the db id, which is auto-incremented

    public function setID($dbID){ $this->id = $dbID; }//this is for the db id, which is auto-incremented - do we also need to add below to other Set function?

    public function setArtist($artistName){ 
        $this->artist = $artistName; 
    }
    public function getArtist(){ 
        print_r( 'Artist: '.$this->artist . '<br>'); 
    }
    public function setTitle($titleName){ 
        $this->title = $titleName; 
    }
    public function getTitle(){ 
        print_r('Title: '.$this->title . '<br>'); 
    }
    public function setRank($rankNumber){ 
        $this->rank = $rankNumber; 
    }
    public function getRank(){ 
        print_r('Rank: '.$this->rank . '<br>'); 
    }
    public function setYear($releaseYear){ 
        $this->year = $releaseYear; 
    }
    public function getYear(){ 
        print_r('Year: '.$this->year . '<br>'); 
    }
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
    public function setData($data_row){
       $this->setArtist($data_row[3]);
       $this->setTitle($data_row[2]);
       $this->setRank($data_row[0]);
       $this->setYear($data_row[1]);
       $this->setGenres($data_row[4]);
       $this->setSubgenres($data_row[5]);
    }

    public function getData(){
        $this->getArtist();
        $this->getTitle();
        $this->getYear();
        $this->getRank();
        $this->getGenres();
        $this->getSubgenres();
    }

    public function save(){
        global $pdo;//global refers to a variable that exists outside of this class; $pdo will connect to db

        try{
            $album_insert = $pdo->prepare("INSERT INTO album (number, year, title, artist, subgenre)
                                            VALUES (?, ?, ?, ?, ?)");
            $db_album = $album_insert->execute([$this->rank, $this->year, $this->title, $this->artist, implode(',',$this->subgenres)]);
            $this->id = $pdo->lastInsertId();//view results from insert code above
            print_r("--Saved $this->title to the database.--<br>\n");     
            //everything that we're doing here that will involve SQL is managed by pdo
            //we don't want duplicate Genres inserted (we may reuse data, but we don't need new Genres reentered each time if a Genre we want to use is already in the DB)
            //our DB has multiple tables, including lookup tabels; so we have to consider how data enters into the DB.
            //whatever is in this block of code, php will attempt to execute, but if you run into an error, it will stop and 'catch' the error, and now print the error as you commanded below

            $select_genre = $pdo->prepare("SELECT * FROM genre WHERE name = ?");//see if genre already exists
            $genre_insert = $pdo->prepare("INSERT INTO genre (name) VALUES (?)");//insert genre if doesn't already exist
            $genre_link = $pdo->prepare("INSERT INTO album_genre (album_id, genre_id) VALUES (?, ?)");//link genre to album

            //walk through array of genres
            for(i=0); $i<count($this->genres); $i++){
                //is genre already in DB? Execute select statement written above
                $select_genre->execute([$this->genres[$i]]);
                //access result from query; might get one result (if already exists), or no result
                $existing_genre = $select_genre->fetch();//fetch has to be used after execute statement; this stores first result in existing genre(array of data), or a false.
                if(!$existing_genre){
                    $db_genre = $genre_insert->execute([$this->genres[$i]]);//! = no, so if no genre doesn't exist, we need to insert it
                    $genre_id = $pdo->lastInsertID();//need genre id to link it back to album
                } else {
                    $genre_id = $existing_genre['id'];//if already did exist
                }
                $genre_link->execute([$this->id, $genre_id]);//execute linking statement
                print_r("Connected ".$this->genres[$i]." to $this->title<br>\n");//confirm result            
            }
            flush();
            ob_flush();//these two flush lines makes data appear as it is created and allow us to see in real time how the code is executed

        }   catch (PDOException $e){
                print_r ("Error saving album to database: " .$e->getmessage() . "<br>\n");
                exit;//exit out of this particular section of code after an error
        }
    }
    static public function load($genre=false){
        global $pdo; 

        $albums = array();

        try{//select everything out of the album table; order by which field and ascending or descending?
            if($genre=false){//then the two lines below will happen
                $select_albums = $pdo->prepare("SELECT * FROM album ORDER BY number ASC");
                $select_albums->execute();//execute select statement
            } else {
                $select_albums = $pdo->prepare("SELECT album.* FROM album, album_genre, genre
                                                WHERE album.id = album_genre.album_id AND
                                                album_genre.genre_id = genre.id AND
                                                genre.name = ?
                                                ORDER BY album.number ASC");
                $select_albums->execute([$genre]);//execute select statement
            }

            $select_genres = $pdo->prepare("SELECT genre.name AS name 
                                            FROM album_genre, genre 
                                            WHERE album_genre.album_id = ? 
                                            AND album_genre.genre_id = genre.id");
                        

            $db_albums = $select_albums->fetchAll();//put results in a variable, and fetch all of the results in an array

            for($i=0; $i<count($db_albums); $i++){
                $album = new Album();//empty Album object
                $album->setTitle($db_albums[$i]['title']);//call each of the set functions
                $album->setYear($db_albums[$i]['year']);
                $album->setRank($db_albums[$i]['number']);
                $album->setArtist($db_albums[$i]['artist']);
                $album->setSubgenres($db_albums[$i]['subgenre']);
                $album->setID($db_albums[$i]['id']);

                $select_genre->execute([$album->id]);//executes genre query defined above
                $db_genres = $select_genre->fetchAll();//expect multiple results
                $genres = array();
                for($j=0; $j<count($db_genres); $j++){
                    array_push($genres, $db_genres[$j]['name']);
                }
                $album->setGenres(implode(',', $genres));
                array_push($albums, $album);
            }
            return $albums;//takes data out of a function and allows you to assign it to a variable outside of the function (like in the Album.php file)

        } catch (PDOException $e){
            print_r ("Error reading album from database: " .$e->getmessage() . "<br>\n");
            exit;
    }
}
?>
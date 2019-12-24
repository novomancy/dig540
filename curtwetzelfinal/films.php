<?php
class Film{
    private $director;
    private $title;
    private $year;
    private $genres;
    private $id;

    public function setID($dbID){ $this->id = $dbID; }
    public function setDirector($directorName){ $this->director = $directorName; }
    public function getDirector(){ print_r( 'Director: '.$this->director . '<br>'); }
    public function setTitle($titleName){ $this->title = $titleName; }
    public function getTitle(){ print_r('Title: '.$this->title . '<br>'); }
    public function setYear($releaseYear){ $this->year = $releaseYear; }
    public function getYear(){ print_r('Year: '.$this->year . '<br>'); }
    public function setGenres($genres){ 
        $this->genres = str_getcsv($genres);
    }
    public function getGenres(){ 
        for($j=0; $j<count($this->genres); $j++){
            print_r('<a href="list_films.php?genre='.$this->genres[$j].'">Genre #'.($j+1).' is '.$this->genres[$j].'</a><br>');
        }
    }
    
    public function getTitleLink(){
        $anchor = '<a href="show_film.php?id='.$this->id.'">'.$this->title.'</a>';
        print_r(': '. $anchor . ' by ' . $this->director . '<br>');
    }

    public function setData($data_row){
        $this->setDirector($data_row[3]);
        $this->setTitle($data_row[2]);
        $this->setYear($data_row[1]);
        $this->setGenres($data_row[4]);
    }
        public function getData(){
        $this->getTitle();
        $this->getYear();
        $this->getDirector();
        $this->getGenres();
    }

    public function save(){
        global $pdo;

        try{
            $film_insert = $pdo->prepare("INSERT INTO film (number, year, title, director)
                                            VALUES (?, ?, ?, ?, ?)");
            $db_film = $film_insert->execute([$this->rank, $this->year, $this->title, $this->director, implode(',')]);
            $this->id = $pdo->lastInsertId();

            print_r("--Saved $this->title to the database.--<br>\n");

            $select_genre = $pdo->prepare("SELECT * FROM genre WHERE name = ?");
            $genre_insert = $pdo->prepare("INSERT INTO genre (name) VALUES (?)");
            $genre_link = $pdo->prepare("INSERT INTO film_genre (film_id, genre_id) VALUES (?, ?)");

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
            print_r("Error saving film to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load_by_id($id){
        global $pdo;

        try{
            $find_film = $pdo->prepare("SELECT * FROM film
                                            WHERE id = ?");
            $select_genre = $pdo->prepare("SELECT genre.name AS name
                                                FROM film_genre, genre
                                                WHERE film_genre.film_id = ?
                                                AND film_genre.genre_id = genre.id");
            $find_film->execute([$id]);
            $db_film = $find_film->fetch();
            if(!$db_film){
                return false;
            } else {
                $film = new film();
                $film->setTitle($db_film['title']);
                $film->setYear($db_film['year']);
                $film->setDirector($db_film['director']);
                $film->setID($id);

                $select_genre->execute([$id]);
                $db_genres = $select_genre->fetchAll();
                $genres = array();
                for($j=0; $j<count($db_genres); $j++){
                    array_push($genres, $db_genres[$j]['name']);
                }
                $film->setGenres(implode(',', $genres));
                return $film;                
            }
        } catch (PDOException $e){
            print_r("Error reading single film from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load($genre=false){
        global $pdo;

        $films = array();
        try{
            if($genre==false){
                $select_films = $pdo->prepare("SELECT * FROM film ORDER BY number ASC");
                $select_films->execute();
            } else {
                $select_films = $pdo->prepare("SELECT film.* FROM film, film_genre, genre
                                                WHERE film.id = film_genre.film_id AND
                                                  film_genre.genre_id = genre.id AND
                                                  genre.name = ?
                                                ORDER BY film.number ASC");
                $select_films->execute([$genre]);
            }
            
            $select_genre = $pdo->prepare("SELECT genre.name AS name
                                            FROM film_genre, genre
                                            WHERE film_genre.film_id = ?
                                              AND film_genre.genre_id = genre.id");


            $db_films = $select_films->fetchAll();

            for($i=0; $i<count($db_films); $i++){
                $film = new film();
                $film->setTitle($db_films[$i]['title']);
                $film->setYear($db_films[$i]['year']);
                $film->setDirector($db_films[$i]['director']);
                $film->setID($db_films[$i]['id']);

                $select_genre->execute([$film->id]);
                $db_genres = $select_genre->fetchAll();
                $genres = array();
                for($j=0; $j<count($db_genres); $j++){
                    array_push($genres, $db_genres[$j]['name']);
                }
                $film->setGenres(implode(',', $genres));
                array_push($films, $film);
            }
            return $films;
        } catch (PDOException $e){
            print_r("Error reading film from database: ".$e->getMessage() . "<br>\n");
            exit;

            
        }
    }
}
?> 
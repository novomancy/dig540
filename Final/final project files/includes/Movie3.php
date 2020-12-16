
<?php
class Movie{
	private $id; 
	private $rank; 
	private $title; 
	private $year; 
	private $director; 
	private $image_url; 
	private $genres; 
	private $subgenres; 
	
	public function setID($id){
		$this->id = $id; }
	public function getID(){
		print_r('ID: '.$this->id . '<br>'); 
	}

	public function setRank($rankNumber){ 
		$this->rank = $rankNumber;}
	public function getRank(){ 
			print_r('Rank: '.$this->rank . '<br>'); }

	public function setTitle($titleName){ 
		$this->title = $titleName;}
    public function getTitle(){ 
		print_r('Title: '.$this->title . '<br>'); }

	public function setYear($releaseYear){ 
		 $this->year = $releaseYear; }
    public function getYear(){ 
		print_r('Year: '.$this->year . '<br>'); } 

	public function setDirector($directorName){ 
		$this->director = $directorName; }
    public function getDirector(){ 
		print_r('Director: '.$this->director . '<br>'); }

	public function setImageURL($image_url){ 
		$this->image_url = $image_url; }
	public function getImageURL(){ 
		print_r('ImageURL: <img src="'.$this->image_url .'"><br>');}

	public function setGenres($genres){ 
		$this->genres = str_getcsv($genres);}
	public function getGenres(){ 
		for($j=0; $j<count($this->genres); $j++){
			print_r('<a href="list_movies.php?genre='.$this->genres[$j].'">Genre #'.($j+1).' is '.$this->genres[$j].'</a><br>');}
	}

	public function setSubgenres($subgenres){ 
        $this->subgenres = str_getcsv($subgenres);}
    public function getSubgenres(){ 
		for($j=0; $j<count($this->subgenres); $j++){
		print_r('<a href="list_movies.php?subgenre='.$this->subgenres[$j].'">Subgenre #'.($j+1).' is '.$this->subgenres[$j].'</a><br>');}
	}

	public function getTitleLink(){
        $anchor = '<a href="show_movie.php?id='.$this->id.'">'.$this->title.'</a>';
        print_r($this->id . ': '. $anchor . ' by ' . $this->director . '<br>');}
		
	public function setData($data_row){
        	$this->setRank($data_row[0]);
        	$this->setTitle($data_row[1]);
        	$this->setYear($data_row[2]);
        	$this->setDirector($data_row[3]);
        	$this->setGenres($data_row[4]);
        	$this->setSubgenres($data_row[5]);
        	$this->setImageURL($data_row[6]);
	}

    public function getData(){
        	$this->getRank();
        	$this->getTitle();
        	$this->getYear();
        	$this->getDirector();
        	$this->getGenres();
        	$this->getSubgenres();
        	$this->getImageURL();
	}


		
	public function save(){
			global $pdo;

			try{
				$movie_insert = $pdo->prepare("INSERT INTO movie (number, title, year, director, image_url) VALUES (?, ?, ?, ?, ?)"); 
				$db_movie = $movie_insert->execute([$this->rank, $this->title, $this->year, $this->director, $this->image_url]); 
				$this->id = $pdo->lastInsertId();
				print_r("--Saved $this->title to the database.--<br>\n"); 

				$select_genre = $pdo->prepare("SELECT * FROM genre WHERE name = ?"); 
				$genre_insert = $pdo->prepare("INSERT INTO genre (name) VALUES (?)"); 
				$genre_link = $pdo->prepare("INSERT INTO movie_genre (movie_id, genre_id) VALUES (?, ?)"); 

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
				$select_subgenre = $pdo->prepare("SELECT * FROM subgenre WHERE name = ?"); 
				$subgenre_insert = $pdo->prepare("INSERT INTO subgenre (name) VALUES (?)"); 
				$subgenre_link = $pdo->prepare("INSERT INTO movie_subgenre (movie_id, subgenre_id) VALUES (?, ?)"); 

				for($i=0; $i<count($this->subgenres); $i++){
					$select_subgenre->execute([$this->subgenres[$i]]); 
					$existing_subgenre = $select_subgenre->fetch();
					if(!$existing_subgenre){
						$db_subgenre = $subgenre_insert->execute([$this->subgenres[$i]]);
						$subgenre_id = $pdo->lastInsertID();
					} else {
						$subgenre_id = $existing_subgenre['id'];
					}
					$subgenre_link->execute([$this->id, $subgenre_id]); 
					print_r("Connected ".$this->subgenres[$i]." to $this->title<br>\n");
			}

			flush();
            ob_flush();
			} catch (PDOException $e){
				print_r("Error saving movie to database: ".$e->getMessage() . "<br>\n");
				exit;
			}	
	}

    static public function load_by_id($id){
        global $pdo;
    
        try{
            $find_movie = $pdo->prepare("SELECT * FROM movie
                                            WHERE id = ?");

            $find_movie->execute([$id]);
            $db_movie = $find_movie->fetch();
           
        

        } catch (PDOException $e){
            print_r("Error reading single movie from database: ".$e->getMessage() . "<br>\n");
            exit;
            }


    static public function load_by_id_genre($genre=false){
        global $pdo;

    try{
        $find_movie = $pdo->prepare("SELECT * FROM movie
                                        WHERE id = ?");
        $select_genre = $pdo->prepare("SELECT genre.name AS name
                                            FROM movie_genre, genre
                                            WHERE movie_genre.movie_id = ?
                                            AND movie_genre.genre_id = genre.id");
                                            
        $find_movie->execute([$id]);
        $db_movie = $find_movie->fetch();
        if(!$db_movie){
            return false;
        } else {
            $movie = new Movie();
            $movie->setRank($db_movie['number']);
            $movie->setTitle($db_movie['title']); 
            $movie->setYear($db_movie['year']);
            $movie->setDirector($db_movie['director']);
            $movie->setImageURL($db_movie['image_url']);
            $movie->setID($id);

            $select_genre->execute([$id]);
            $db_genres = $select_genre->fetchAll();
            $genres = array();
            for($j=0; $j<count($db_genres); $j++){
                array_push($genres, $db_genres[$j]['name']);
            }
            $movie->setGenres(implode(',', $genres));
            return $movie;                
        }
    } catch (PDOException $e){
        print_r("Error reading single movie from database: ".$e->getMessage() . "<br>\n");
        exit;
        }
    }


static public function load_by_id_subgenre($subgenre=false){
    global $pdo;

    try{
        $find_movie = $pdo->prepare("SELECT * FROM movie
                                        WHERE id = ?");
        $select_subgenre = $pdo->prepare("SELECT subgenre.name AS name
                                            FROM movie_subgenre, subgenre
                                            WHERE movie_subgenre.movie_id = ?
                                            AND movie_subgenre.subgenre_id = subgenre.id");
                                            
        $find_movie->execute([$id]);
        $db_movie = $find_movie->fetch();
        if(!$db_movie){
            return false;
        } else {
            $movie = new Movie();
            $movie->setRank($db_movie['number']);
            $movie->setTitle($db_movie['title']); 
            $movie->setYear($db_movie['year']);
            $movie->setDirector($db_movie['director']);
            $movie->setImageURL($db_movie['image_url']);
            $movie->setID($id);

            $select_subgenre->execute([$id]);
            $db_subgenres = $select_subgenre->fetchAll();
            $subgenres = array();
            for($j=0; $j<count($db_subgenres); $j++){
                array_push($subgenres, $db_subgenres[$j]['name']);
            }
            $movie->setSubgenres(implode(',', $subgenres));
            return $movie;                
        }
    } catch (PDOException $e){
        print_r("Error reading single movie from database: ".$e->getMessage() . "<br>\n");
        exit;
        }
    }



	static public function load_genre($genre=false){
        global $pdo;

        $movies = array();
        try{
            if($genre==false){
                $select_movies = $pdo->prepare("SELECT * FROM movie ORDER BY number ASC");
                $select_movies->execute();
            } else {
                $select_movies = $pdo->prepare("SELECT movie.* FROM movie, movie_genre, genre
                                                WHERE movie.id = movie_genre.movie_id AND
                                                  movie_genre.genre_id = genre.id AND
                                                  genre.name = ?
                                                ORDER BY movie.number ASC");
                $select_movies->execute([$genre]);
            }
            
            $select_genre = $pdo->prepare("SELECT genre.name AS name
                                            FROM movie_genre, genre
                                            WHERE movie_genre.movie_id = ?
                                              AND movie_genre.genre_id = genre.id");

            $db_movies = $select_movies->fetchAll();


				for($i=0; $i<count($db_movies); $i++){
					$movie = new Movie();
					$movie->setID($db_movies[$i]['id']);
					$movie->setRank($db_movies[$i]['number']); 
					$movie->setTitle($db_movies[$i]['title']); 
					$movie->setYear($db_movies[$i]['year']);
					$movie->setDirector($db_movies[$i]['director']);
					$movie->setImageURL($db_movies[$i]['image_url']);
				   
					$select_genre->execute([$movie->id]);
					$db_genres = $select_genre->fetchAll();
					$genres = array();
					for($j=0; $j<count($db_genres); $j++){
						array_push($genres, $db_genres[$j]['name']);
					}
					$movie->setGenres(implode(',', $genres));
					array_push($movies, $movie);
            }
            return $movies;
        } catch (PDOException $e){
            print_r("Error reading movie from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
	}
	
	static public function load_subgenre($subgenre=false){
        global $pdo;

        $movies = array();
        try{
            if($subgenre==false){
                $select_movies = $pdo->prepare("SELECT * FROM movie ORDER BY number ASC");
                $select_movies->execute();
            } else {
                $select_movies = $pdo->prepare("SELECT movie.* FROM movie, movie_subgenre, subgenre
                                                WHERE movie.id = movie_subgenre.movie_id AND
                                                  movie_subgenre.subgenre_id = subgenre.id AND
                                                  subgenre.name = ?
                                                ORDER BY movie.number ASC");
                $select_movies->execute([$subgenre]);
            }
            
            $select_subgenre = $pdo->prepare("SELECT subgenre.name AS name
                                            FROM movie_subgenre, subgenre
                                            WHERE movie_subgenre.movie_id = ?
                                              AND movie_subgenre.subgenre_id = subgenre.id");

            $db_movies = $select_movies->fetchAll();


				for($i=0; $i<count($db_movies); $i++){
					$movie = new Movie();
					$movie->setID($db_movies[$i]['id']);
					$movie->setRank($db_movies[$i]['number']); 
					$movie->setTitle($db_movies[$i]['title']); 
					$movie->setYear($db_movies[$i]['year']);
					$movie->setDirector($db_movies[$i]['director']);
					$movie->setImageURL($db_movies[$i]['image_url']);
				   
					$select_subgenre->execute([$movie->id]);
					$db_subgenres = $select_subgenre->fetchAll();
					$subgenres = array();
					for($j=0; $j<count($db_subgenres); $j++){
						array_push($subgenres, $db_subgenres[$j]['name']);
					
					$movie->setSubgenres(implode(',', $subgenres));
					array_push($movies, $movie);
            }
            return $movies;
        } catch (PDOException $e){
            print_r("Error reading movie from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }
}
?>

<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 

    class Film{
        private $year;
        private $length;
        private $title;
        private $subject;
        private $actor;
        private $actress;
        private $director;
        private $popularity;
        private $awards;
        private $image;
        

        public function setYear($releaseYear){ $this->year = $releaseYear; }
        public function getYear(){ print_r('Year: '.$this->year . '<br>'); }
        public function setLength($movieLength){$this->length = $movieLength;}
        public function getLength(){print_r('Movie Length: '.$this->length . '<br>');}
        public function setTitle($titleName){ $this->title = $titleName; }
        public function getTitle(){ print_r('Title: '.$this->title . '<br>'); }
        public function setSubject($movieSubject){ $this->subject = $movieSubject; }
        public function getSubject(){print_r('Movie Subject: '.$this->subject . '<br>');}
        public function setActor($actorName){ $this->actor = $actorName; }
        public function getActor(){ print_r( 'Main Actor: '.$this->actor . '<br>'); }
        public function setActress($actressName){ $this->actress = $actressName; }
        public function getActress(){ print_r( 'Main Actress: '.$this->actress . '<br>'); }
        public function setDirector($directorName){ $this->director = $directorName; }
        public function getDirector(){ print_r( 'Director: '.$this->director . '<br>'); }
        public function setPopularity($popularityNumber){ $this->popularity = $popularityNumber; }
        public function getPopularity(){ print_r('Popularity: '.$this->popularity . '<br>'); }    
        public function setAwards($awardsNumber){ $this->awards = $awardsNumber; }
        public function getAwards(){ print_r('Awards: '.$this->awards . '<br>'); }
        public function setImage($imageValue){ $this->image = $imageValue; }
        public function getImage(){print_r('Image:' .$this->image . '<br>'); }
       
        // public function setGenres($genres){ 
        //     $this->genres = str_getcsv($genres);
        // }
        // public function getGenres(){ 
        //     for($j=0; $j<count($this->genres); $j++){
        //         if($j%2==0) print_r("<span style='color:blue'>Genre #".($j+1)." is ".$this->genres[$j]."</span><br>");
        //         else print_r("<span style='color:goldenrod'>Genre #".($j+1)." is ".$this->genres[$j]."</span><br>");
        //     }
        // }
        // public function setSubgenres($subs){ 
        //     $this->subgenres = str_getcsv($subs);
        // }
        // public function getSubgenres(){ 
        //     for($j=0; $j<count($this->subgenres); $j++){
        //         if($j%2==0) print_r("<span style='color:coral'>Subgenre #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
        //         else print_r("<span style='color:darkcyan'>Subgenre #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
        //     }
        // }
        
        public function setData($data_row){
            // this is supposed to replace the "while" loop that pulls the data out
            // make this a function that pulls up other functions and puts them together. But also needs to pass in the data, so it will be more complicated that the getData function from the video
        
        // $this->setArtist($data_row[3]);
        // $this->setTitle($data_row[2]);
        // $this->setRank($data_row[0]);
        // $this->setYear($data_row[1]);
        // $this->setGenres($data_row[4]);
        // $this->setSubgenres($data_row[5]);

        $this->setYear($data_row[0]);
        $this->setLength($data_row[1]);
        $this->setTitle($data_row[2]);
        $this->setSubject($data_row[3]);
        $this->setActor($data_row[4]);
        $this->setActress($data_row[5]);
        $this->setDirector($data_row[6]);
        $this->setPopularity($data_row[7]);
        $this->setAwards($data_row[8]);
        $this->setImage($data_row[9]);

            }
        public function getData(){
            // this function is supposed to replace the "for" loop that prints out the data
            $this->getYear();
            $this->getLength();
            $this->getTitle();
            $this->getSubject();
            $this->getActor();
            $this->getActress();   
            $this->getDirector();
            $this->getPopularity();
            $this->getAwards();
            $this->getImage();

    
        }
    
    }

    $file_handle = fopen('./film.csv', 'r');

    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('<div style ="background-color:teal">'.'Column header found: '.$first_line[$i].'<br>'.'</div>');
    }
    //the first part and the first loop need to stay because getting the column headers is its own thing i think

    $films = array();
    
    while($data_row = fgetcsv($file_handle, null, ';')){

        $film = new Film();
        $film->setData($data_row);
        //this calls the setData function which does the stuff that the code that was here before did
        array_push($films, $film);
    }

    for($i=1; $i<count($films); $i++){
        print_r("<p>This is the #".($i)." film:<br>");

        $films[$i]->getData();
        //here i am just calling the function that I made up above instead of all the stuff that was here before
        print_r('</p>');
    }

    fclose($file_handle);
?>

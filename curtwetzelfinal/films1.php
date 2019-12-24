<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    class Film{
        private $director;
        private $title;
        private $year;
        private $genres;
        public function setDirector($directorName){ $this->director = $directorName; }
        public function getDirector(){ print_r( 'Director: '.$this->director . '<br>'); }
        public function setTitle($titleName){ $this->title = $titleName; }
        public function getTitle(){ print_r('Title: '.$this->title . '<br>'); }
        public function setYear($releaseYear){ $this->year = $releaseYear; }
        public function getYear(){ print_r('Year: '.$this->year . '<br>'); }
        public function setGenres($genres){ 
            $this->genres = str_getcsv($genres); }
        public function getGenres(){ 
            for($i=0; $i<count($this->genres); $i++){
                if($i%2==0) print_r("<span style='color:blue'>Genre #".($i+1)." is ".$this->genres[$i]."</span><br>");
            }
        }
        public function setData($data_row){
            $this->setDirector($data_row[3]);
            $this->setTitle($data_row[2]);
            $this->setYear($data_row[1]);
            $this->setGenres($data_row[4]);
        }
        public function getData(){
            $this->getDirector();
            $this->getTitle();
            $this->getYear();
            $this->getGenres();
        }
        {if($i%=2) print_r(
            <p>
            <b>Image title:</b> <?php echo $image_url['lastmanonearth.jpg'];?><br>
            <img src="<?php echo $image_url['image_url'];?>">
            </p>)
    }
        {if($i%=3) print_r (<p>
            <b>Image title:</b> <?php echo $image_url['a-boy-and-his-dog.jpg'];?><br>
            <img src="<?php echo $image_url['image_url'];?>">
            </p>)
        
    }
    
}
    $file_handle = fopen('./filmlist.csv', 'r');
    $first_line = fgetcsv($file_handle);
    for($i=0; $i<count($first_line); $i++)
    $films = array();
    
    while($data_row = fgetcsv($file_handle)){
        $film = new Film();
        $film->setData($data_row);
        array_push($films, $film);
    }
    for($i=count($films); $i>=0; $i--){
        print_r("<p>This is the #$i film:<br>");
        
        $films[$i-1]->getData();
        print_r('</p>');
    
    }

    fclose($file_handle);
    

?>
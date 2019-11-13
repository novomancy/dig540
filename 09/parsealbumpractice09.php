<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 

    class Album{
        private $artist;
        private $title;
        private $rank;
        private $year;
        private $genres;
        private $subgenres;

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
                else print_r("<span style='color:goldenrod'>Genre #".($j+1)." is ".$this->genres[$j]."</span><br>");
            }
        }
        public function setSubgenres($subs){ 
            $this->subgenres = str_getcsv($subs);
        }
        public function getSubgenres(){ 
            for($j=0; $j<count($this->subgenres); $j++){
                if($j%2==0) print_r("<span style='color:coral'>Subgenre #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
                else print_r("<span style='color:darkcyan'>Subgenre #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
            }
        }
        public function setData($data_row){
            // I think this is supposed to replace the "while" loop that pulls the data out?
            // make this a function that pulls up other functions and puts them together. But also needs to pass in the data, so it will be more complicated that the getData function from the video
        
        $this->setArtist($data_row[3]);
        $this->setTitle($data_row[2]);
        $this->setRank($data_row[0]);
        $this->setYear($data_row[1]);
        $this->setGenres($data_row[4]);
        $this->setSubgenres($data_row[5]);



            }
        public function getData(){
            //i think this function is supposed to replace the "for" loop that prints out the data
            $this->getArtist();
            $this->getTitle();
            $this->getRank();
            $this->getYear();
            $this->getGenres();
            $this->getSubgenres();   
        
        }
    
    }

    $file_handle = fopen('./albumlist.csv', 'r');

    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('<div style ="background-color:teal">'.'Column header found: '.$first_line[$i].'<br>'.'</div>');
    }
    //the first part and the first loop need to stay because getting the column headers is its own thing i think

    $albums = array();
    
    while($data_row = fgetcsv($file_handle)){

        $album = new Album();
        $album->setData($data_row);
        //this calls the setData function which does the stuff that the code that was here before did
        array_push($albums, $album);
    }

    for($i=0; $i<count($albums); $i++){
        print_r("<p>This is the #".($i+1)." album:<br>");

        $albums[$i]->getData();
        //here i am just calling the function that I made up above instead of all the stuff that was here before
        print_r('</p>');
    }

    fclose($file_handle);
?>

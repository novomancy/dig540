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

        public function setData($artist, $title, $rank, $year, $genres, $subgenres){
            $this->artist = $artist;
            $this->title = $title;
            $this->rank = $rank;
            $this->year = $year;           
            $this->genres = str_getcsv ($genres);
            $this->subgenres = str_getcsv ($subgenres);
            
          
        
            // $this->title = $titleName;
            // $this->rank = $rankNumber;
            // $this->year = $releaseYear);
            // $this->artist = $artistName;                  
            // $this->genres = $genres;
            // $this->subgenres = $subgenres;

            // $this->title = ($data_row[2]);
            // $this->rank = ($data_row[0]);
            // $this->year = ($data_row[3]);
            // $this->artist = ($data_row[1]);                  
            // $this->genres = ($data_row[4]);
            // $this->subgenres = ($data_row[5]);

            // $this->artist = $artistName; 
            
        }

        public function getData(){
            
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
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    $albums = array();
    
    while($data_row = fgetcsv($file_handle)){
       $album = new Album();
         
       $album->setData($data_row[3], $data_row[2], $data_row[0], $data_row[1], $data_row[4], $data_row[5]);
        
        //setData($artist, $title, $rank, $year, $genres, $subgenres){
        //$albums[$i]->setData(); (taking this out and replacing with "this")
      
        // $album->setArtist($data_row[1]);
        // $album->setTitle($data_row[3]);
        // $album->setRank($data_row[0]);
        // $album->setYear($data_row[2]);
        // $album->setGenres($data_row[4]);
        // $album->setSubgenres($data_row[5]);
        array_push($albums, $album);
    }

   
    for($i=count($albums)-1; $i>=0; $i--){
         print_r("<p>This is the #$i album:<br>");

        
         $albums[$i]->getData(); 
        // $albums[$i]->getData();
        // $albums[$i]->getTitle();
        // $albums[$i]->getYear();
        // $albums[$i]->getRank();
        // $albums[$i]->getArtist();
        // $albums[$i]->getGenres();
        // $albums[$i]->getSubgenres();
           print_r('</p>');
    }
        //the "get" command is allowing the code to print out the information. The "set" kind of sets it up. 

       // The other thing I see here is that you’re using $data_row inside the function setData, 
       //but $data_row doesn’t exist inside that function. Take a look at how data is getting into
       //the other setX functions, both on the public function set... lines and the commented out lines
       // where the functions are being called (94-99) and you’ll notice a difference between that
       // and what you’re doing with setData.

       //public function setData()
    fclose($file_handle);
?>
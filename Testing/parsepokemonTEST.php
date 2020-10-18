<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 

    class Pokemon{
        private $pokedex;
        private $species;
        private $type;
        private $buddy_candy;
        private $evolve_candy;
        private $evolve_from;
        private $evolve_to;
        private $region;
        private $generation;
        private $extd;
        

        public function setPokedex($pokedexNumber){ $this->pokedex = $pokedexNumber; }
        public function getPokedex(){ print_r('Pokedex:# '.$this->pokedex . '<br>'); }
        public function setSpecies($speciesName){$this->species = $speciesName;}
        public function getSpecies(){print_r('Species: '.$this->species . '<br>');}
        public function setBuddyCandy($buddyCandyDistance){ $this->buddy_candy = $buddyCandyDistance; }
        public function getBuddyCandy(){ print_r('Walk this many km to earn a candy: '.$this->buddy_candy . '<br>'); }
        public function setEvolveCandy($evolveCandy){ $this->evolve_candy = $evolveCandy; }
        public function getEvolveCandy(){print_r('Candies Needed to Evolve: '.$this->evolve_candy . '<br>');}
        public function setEvolvesFrom($evolvesFrom){ $this->evolve_from = $evolvesFrom; }
        public function getEvolvesFrom(){ print_r( 'Evolves From: '.$this->evolve_from . '<br>'); }
        public function setEvolvesTo($evolvesTo){ $this->evolve_to = $evolvesTo; }
        public function getEvolvesTo(){ print_r( 'Evolves To: '.$this->evolve_to . '<br>'); }
        public function setRegion($regionName){ $this->region = $regionName; }
        public function getRegion(){ print_r( 'Region First Discoverd: '.$this->region . '<br>'); }
        public function setGeneration($generationNumber){ $this->generation = $generationNumber; }
        public function getGeneration(){ print_r( 'Generation: '.$this->generation . '<br>'); }
        public function setExtd($extdValue){ $this->extd = $extdValue; }
        public function getExtd(){ print_r('Special Information: '.$this->extd . '<br>'); }  
       
        public function setType($type){ 
            $this->type = str_getcsv($type);
        }
        public function getType(){ 
            for($j=0; $j<count($this->type); $j++){
                if($j%2==0) print_r("<span style='color:blue'>Type #".($j+1)." is ".$this->type[$j]."</span><br>");
                else print_r("<span style='color:red'>Type #".($j+1)." is ".$this->type[$j]."</span><br>");
            }
        }
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
        
        $this->setPokedex($data_row[0]);
        $this->setSpecies($data_row[1]);
        $this->setType($data_row[2]);
        $this->setBuddyCandy($data_row[3]);
        $this->setEvolveCandy($data_row[4]);
        $this->setEvolvesFrom($data_row[5]);
        $this->setEvolvesTo($data_row[6]);
        $this->setRegion($data_row[7]);
        $this->setGeneration($data_row[8]);
        $this->setExtd($data_row[9]);


            }
        public function getData(){
            // this function is supposed to replace the "for" loop that prints out the data
            $this->getPokedex();
            $this->getSpecies();
            $this->getType();
            $this->getBuddyCandy();
            $this->getEvolveCandy();
            $this->getEvolvesFrom();
            $this->getEvolvesTo();   
            $this->getRegion();
            $this->getGeneration();
            $this->getExtd();
          

    
        }
    
    }

    $file_handle = fopen('./pokemon.csv', 'r');

    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('<div style ="background-color:goldenrod">'.'Column header found: '.$first_line[$i].'<br>'.'</div>');
    }
    //the first part and the first loop need to stay because getting the column headers is its own thing i think

    $pokemons = array();
    
    while($data_row = fgetcsv($file_handle)){

        $pokemon = new Pokemon();
        $pokemon->setData($data_row);
        //this calls the setData function which does the stuff that the code that was here before did
        array_push($pokemons, $pokemon);
    }

    for($i=0; $i<count($pokemons); $i++){

        $pokemons[$i]->getData();
        //here i am just calling the function that I made up above instead of all the stuff that was here before
        print_r('</p>');
    }

    fclose($file_handle);
?>

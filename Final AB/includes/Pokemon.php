<?php

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
    private $exdt;
    private $id;

    public function setID($dbID){ $this->id = $dbID; }
    public function setPokedex($pokedexNumber){ $this->pokedex = $pokedexNumber; }
    public function getPokedex(){ print_r(''.$this->pokedex . '<br>'); }
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
    public function setExdt($exdtValue){ $this->exdt = $exdtValue; }
    public function getExdt(){ print_r('Special Information: '.$this->exdt . '<br>'); }  
   
    public function setType($type){ 
        $this->type = str_getcsv($type);
    }
    public function getType(){ 
        for($j=0; $j<count($this->type); $j++){
            if($j%2==0) print_r("<span style='color:blue'>Type #".($j+1)." is ".$this->type[$j]."</span><br>");
            else print_r("<span style='color:red'>Type #".($j+1)." is ".$this->type[$j]."</span><br>");
        }
    }

    
    public function setData($data_row){
        // this is a function that pulls up other functions and puts them together. But it also passes in the data   
         
    $this->setPokedex($data_row[0]);
    $this->setSpecies($data_row[1]);
    $this->setType($data_row[2]);
    $this->setBuddyCandy($data_row[3]);
    $this->setEvolveCandy($data_row[4]);
    $this->setEvolvesFrom($data_row[5]);
    $this->setEvolvesTo($data_row[6]);
    $this->setRegion($data_row[7]);
    $this->setGeneration($data_row[8]);
    $this->setExdt($data_row[9]);


        }
    public function getData(){
        // this function is supposed to print out the data
        $this->getPokedex();
        $this->getSpecies();
        $this->getType();
        $this->getBuddyCandy();
        $this->getEvolveCandy();
        $this->getEvolvesFrom();
        $this->getEvolvesTo();   
        $this->getRegion();
        $this->getGeneration();
        $this->getExdt();

    }

    public function save(){        
        global $pdo;

        try{
       // between here and the end of connecting types, I have it working as of 1:34am on december 16. Need to rework tables and get the rest of the code working!    
           $pokemon_insert = $pdo->prepare("INSERT INTO pokemon (pokemon_pokedex, pokemon_species, pokemon_evolves_from, pokemon_evolves_to, pokemon_exdt)
                                            VALUES (?, ?, ?, ?, ?)");
            $db_pokemon = $pokemon_insert->execute([$this->pokedex, $this->species, $this->evolve_from, 
            $this->evolve_to, $this->exdt]);
            // implode(',', $this->exdt)]);
            // i need to go back and figure out more about the implode thing and what it does. what variable i need to be in there, if any
            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->species to the database.--<br>\n");

            $select_type = $pdo->prepare("SELECT * FROM type WHERE type_name = ?");
            $type_insert = $pdo->prepare("INSERT INTO type (type_name) VALUES (?)");
            $type_link = $pdo->prepare("INSERT INTO pokemon_type (pokemon_id, type_id) VALUES (?, ?)");
            
            for($i=0; $i<count($this->type); $i++){
                $select_type->execute([$this->type[$i]]);
                $existing_type = $select_type->fetch();
                if(!$existing_type){
                    $db_type = $type_insert->execute([$this->type[$i]]);
                    $type_id = $pdo->lastInsertId();
                } else {
                    $type_id = $existing_type['type_id'];
                }
                $type_link->execute([$this->id, $type_id]);
                print_r("Connected ".$this->type[$i]." to $this->species<br>\n");

            // now try to make candy work just like i made types work

            $select_candy = $pdo->prepare("SELECT * FROM candy WHERE candy_to_evolve = ?");
            $candy_insert = $pdo->prepare("INSERT INTO candy (candy_to_evolve) VALUES (?)");
            $candy_link = $pdo->prepare("INSERT INTO candy_pokemon (pokemon_id, candy_id) VALUES (?, ?)");
            for($i=0; $i<count($this->evolve_candy); $i++){
                $select_candy->execute([$this->evolve_candy[$i]]);
                $existing_candy = $select_candy->fetch();
                if(!$existing_candy){
                    $db_candy = $candy_insert->execute([$this->evolve_candy[$i]]);
                    $candy_id = $pdo->lastInsertID();
                } else {
                    $candy_id = $existing_candy['candy_id'];
                }
                $candy_link->execute([$this->id, $candy_id]);
                print_r("Connected ".$this->evolve_candy[$i]." to $this->species<br>\n");
                }
                    

    //the code above seems to work a little, although with errors. It is after this point that things get completely derailed. What do I need to fix?

            // $select_generation = $pdo->prepare("SELECT * FROM generation WHERE generation_name = ?");
            // $generation_insert = $pdo->prepare("INSERT INTO generation (generation_name) VALUES (?)");
            // $generation_link = $pdo->prepare("INSERT INTO pokemon (pokemon_id, generation_id) VALUES (?, ?)");
            // for($i=0; $i<count($this->generation); $i++){
            //     $select_generation->execute([$this->generation[$i]]);
            //     $existing_generation = $select_generation->fetch();
            //     if(!$existing_generation){
            //         $db_generation = $generation_insert->execute([$this->generation[$i]]);
            //         $generation_id = $pdo->lastInsertID();
            //     } else {
            //         $generation_id = $existing_generation['generation_id'];
            //     }
            //     $generation_link->execute([$this->id, $generation_id]);
            //     print_r("Connected ".$this->generation[$i]." to $this->species<br>\n");
                }

            // $select_region = $pdo->prepare("SELECT * FROM region WHERE region_name = ?");
            // $region_insert = $pdo->prepare("INSERT INTO region (region_name) VALUES (?)");
            // $region_link = $pdo->prepare("INSERT INTO pokemon (pokemon_id, region_id) VALUES (?, ?)");
            // for($i=0; $i<count($this->region); $i++){
            //     $select_region->execute([$this->region[$i]]);
            //     $existing_region = $select_region->fetch();
            //     if(!$existing_region){
            //         $db_region = $region_insert->execute([$this->region[$i]]);
            //         $region_id = $pdo->lastInsertID();
            //     } else {
            //         $region_id = $existing_region['id'];
            //     }
            //     $region_link->execute([$this->id, $region_id]);
            //     print_r("Connected ".$this->region[$i]." to $this->species<br>\n");
            //     }

            // $select_buddy_distance_rate = $pdo->prepare("SELECT * FROM buddy_distance_rate WHERE buddy_candy_rate = ?");
            // $buddy_distance_rate_insert = $pdo->prepare("INSERT INTO buddy_distance_rate (buddy_candy_rate) VALUES (?)");
            // $buddy_distance_rate_link = $pdo->prepare("INSERT INTO pokemon (pokemon_id, buddy_id) VALUES (?, ?)");
            // for($i=0; $i<count($this->buddy_distance_rate); $i++){
            //     $select_buddy_distance_rate->execute([$this->buddy_distance_rate[$i]]);
            //     $existing_buddy_distance_rate = $select_buddy_distance_rate->fetch();
            //     if(!$existing_buddy_distance_rate){
            //         $db_buddy_distance_rate = $buddy_distance_rate_insert->execute([$this->buddy_distance_rate[$i]]);
            //         $buddy_id = $pdo->lastInsertID();
            //     } else {
            //         $buddy_id = $existing_buddy_distance_rate['id'];
            //     }
            //     $region_link->execute([$this->id, $buddy_id]);
            //     print_r("Connected ".$this->buddy_distance_rate[$i]." to $this->species<br>\n");
            //     }   


            // flush();
            // ob_flush();
            
         } catch (PDOException $e){
            print_r("Error saving Pokemon to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
 }
 }

?>
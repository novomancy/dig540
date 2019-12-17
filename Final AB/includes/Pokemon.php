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
   
    // the old version
    // public function setBuddyCandy($buddyCandyDistance){ $this->buddy_candy = $buddyCandyDistance; }
    // public function getBuddyCandy(){ print_r('Walk this many km to earn a candy: '.$this->buddy_candy . '<br>'); }
    public function setBuddyCandy($buddyCandyDistance){  
        $this->buddy_candy = str_getcsv($buddyCandyDistance); 
     }
     public function getBuddyCandy() {
     for($j=0; $j<count($this->buddy_candy); $j++){
         print_r("<span style='color:indigo'>Walk this many km to earn a candy: ".$this->buddy_candy[$j]."</span><br>"); }  }  


    // the old version 
    // public function setEvolveCandy($evolveCandy){ $this->evolve_candy = $evolveCandy; }
    // public function getEvolveCandy(){print_r('Candies Needed to Evolve: '.$this->evolve_candy . '<br>');}

    public function setEvolveCandy($evolveCandy){  
        $this->evolve_candy = str_getcsv($evolveCandy); 
     }
     public function getEvolveCandy() {
     for($j=0; $j<count($this->evolve_candy); $j++){
         print_r("<span style='color:purple'>Candies Needed to Evolve: ".$this->evolve_candy[$j]."</span><br>"); }  }
    
    public function setEvolvesFrom($evolvesFrom){ $this->evolve_from = $evolvesFrom; }
    public function getEvolvesFrom(){ print_r( 'Evolves From: '.$this->evolve_from . '<br>'); }
    public function setEvolvesTo($evolvesTo){ $this->evolve_to = $evolvesTo; }
    public function getEvolvesTo(){ print_r( 'Evolves To: '.$this->evolve_to . '<br>'); }
  
    // old version
    // public function setRegion($regionName){ $this->region = $regionName; }
    // public function getRegion(){ print_r( 'Region First Discoverd: '.$this->region . '<br>'); }
   
    public function setRegion($regionName){  
        $this->region = str_getcsv($regionName); 
     }
     public function getRegion() {
     for($j=0; $j<count($this->region); $j++){
         print_r("<span style='color:orange'>Region: ".$this->region[$j]."</span><br>"); }  }

    // old version
    // public function setGeneration($generationNumber){ $this->generation = $generationNumber; }
    // public function getGeneration(){ print_r( 'Generation: '.$this->generation . '<br>'); }
    public function setGeneration($generationNumber){  
        $this->generation = str_getcsv($generationNumber); 
     }
     public function getGeneration() {
     for($j=0; $j<count($this->generation); $j++){
         print_r("<span style='color:green'>Generation: ".$this->generation[$j]."</span><br>"); }  }

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
       // Successfully entering pokemon, candy, and generation data so far 12/16 10:17pm    
           $pokemon_insert = $pdo->prepare("INSERT INTO pokemon (pokemon_pokedex, pokemon_species, pokemon_evolves_from, pokemon_evolves_to, pokemon_exdt)
                                            VALUES (?, ?, ?, ?, ?)");
            $db_pokemon = $pokemon_insert->execute([$this->pokedex, $this->species, $this->evolve_from, 
            $this->evolve_to, $this->exdt]);

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

        //enter data into the candy table and link it to pokemon
            $select_candy = $pdo->prepare("SELECT * FROM candy WHERE candy_to_evolve = ?");
            $candy_insert = $pdo->prepare("INSERT INTO candy (candy_to_evolve) VALUES (?)");
            $candy_link = $pdo->prepare("INSERT INTO candy_pokemon (pokemon_id, candy_id) VALUES (?, ?)");
                  
            for($j=0; $j<count($this->evolve_candy); $j++){
               $select_candy->execute([$this->evolve_candy[$j]]);
               $existing_candy = $select_candy->fetch();
               if(!$existing_candy){
                     $db_candy = $candy_insert->execute([$this->evolve_candy[$j]]);
                     $candy_id = $pdo->lastInsertID();
                } else {
                     $candy_id = $existing_candy['candy_id'];
                 }
                 $candy_link->execute([$this->id, $candy_id]);
                 print_r("Connected ".$this->evolve_candy[$j]." to $this->species<br>\n");
        
        // enter data into the generation table and link it to pokemon      
            $select_generation = $pdo->prepare("SELECT * FROM generation WHERE generation_name = ?");
            $generation_insert = $pdo->prepare("INSERT INTO generation (generation_name) VALUES (?)");
            $generation_link = $pdo->prepare("INSERT INTO pokemon_generation (pokemon_id, generation_id) VALUES (?, ?)");
                for($i=0; $i<count($this->generation); $i++){
                $select_generation->execute([$this->generation[$i]]);
                $existing_generation = $select_generation->fetch();
                if(!$existing_generation){
                $db_generation = $generation_insert->execute([$this->generation[$i]]);
                   $generation_id = $pdo->lastInsertID();
                } else {
                     $generation_id = $existing_generation['generation_id'];
                 }
                 $generation_link->execute([$this->id, $generation_id]);
                 print_r("Connected ".$this->generation[$i]." to $this->species<br>\n"); 
           
           
         // enter data into the region table and link it to pokemon           
            $select_region = $pdo->prepare("SELECT * FROM region WHERE region_name = ?");
            $region_insert = $pdo->prepare("INSERT INTO region (region_name) VALUES (?)");
            $region_link = $pdo->prepare("INSERT INTO pokemon_region (pokemon_id, region_id) VALUES (?, ?)");
                for($i=0; $i<count($this->region); $i++){
                $select_region->execute([$this->region[$i]]);
                $existing_region = $select_region->fetch();
                if(!$existing_region){
                    $db_region = $region_insert->execute([$this->region[$i]]);
                    $region_id = $pdo->lastInsertID();
                } else {
                    $region_id = $existing_region['region_id'];
                }
                $region_link->execute([$this->id, $region_id]);
                print_r("Connected ".$this->region[$i]." to $this->species<br>\n");              
      
         // enter data into the buddy_distance_rate table and link it to pokemon            
            $select_buddy_distance_rate = $pdo->prepare("SELECT * FROM buddy_distance_rate WHERE buddy_candy_rate = ?");
            $buddy_distance_rate_insert = $pdo->prepare("INSERT INTO buddy_distance_rate (buddy_candy_rate) VALUES (?)");
            $buddy_distance_rate_link = $pdo->prepare("INSERT INTO pokemon_buddy_distance_rate (pokemon_id, buddy_id) VALUES (?, ?)");
                for($i=0; $i<count($this->buddy_candy); $i++){
                $select_buddy_distance_rate->execute([$this->buddy_candy[$i]]);
                $existing_buddy_distance_rate = $select_buddy_distance_rate->fetch();
                 if(!$existing_buddy_distance_rate){
                     $db_buddy_distance_rate = $buddy_distance_rate_insert->execute([$this->buddy_candy[$i]]);
                     $buddy_id = $pdo->lastInsertID();
                 } else {
                     $buddy_id = $existing_buddy_distance_rate['buddy_id'];
                 }
                 $buddy_distance_rate_link->execute([$this->id, $buddy_id]);
                 print_r("Connected ".$this->buddy_candy[$i]." to $this->species<br>\n");
                 }                  
        
                
                
                }  
        // This is giving me the error message, but I am not going to deal with it right now
        // Notice: ob_flush(): failed to flush buffer. No buffer to flush in /home/abdignet/public_html/pokemon_data/includes/Pokemon.php on line 217

            // flush();
            //  ob_flush();           
   }}}} catch (PDOException $e){
            print_r("Error saving Pokemon to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
 }
}

?>
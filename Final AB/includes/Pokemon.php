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
    private $extd;
    private $id;

    public function setID($dbID){ $this->id = $dbID; }
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
    $this->setExtd($data_row[9]);


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
        $this->getExtd();

    }

    public function save(){        
        global $pdo;

        try{
            $pokemon_insert = $pdo->prepare("INSERT INTO pokemon (pokedex, species, buddycandy, candytoevolve, evolvesfrom, evolvesto, region, generation, extd)
                                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $db_pokemon = $pokemon_insert->execute([$this->pokedex, $this->species, $this->buddycandy, $this->candytoevolve, $this->evolvesfrom, 
            $this->evolvesto, $this->region, $this->generation, $this->extd]);

            // implode(',', $this->extd)]);
            // i need to go back and figure out more about the implode thing and what it does. what variable i need to be in there, if any

            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->pokemon to the database.--<br>\n");

            $select_type = $pdo->prepare("SELECT * FROM type WHERE name = ?");
            $type_insert = $pdo->prepare("INSERT INTO type (name) VALUES (?)");
            $type_link = $pdo->prepare("INSERT INTO pokemon_type (pokemon_id, type_id) VALUES (?, ?)");

            for($i=0; $i<count($this->type); $i++){
                $select_type->execute([$this->type[$i]]);
                $existing_type = $select_type->fetch();
                if(!$existing_type){
                    $db_tyoe = $type_insert->execute([$this->type[$i]]);
                    $type_id = $pdo->lastInsertID();
                } else {
                    $type_id = $existing_type['id'];
                }
                $type_link->execute([$this->id, $type_id]);
                print_r("Connected ".$this->type[$i]." to $this->pokemon<br>\n");
            }
            flush();
            ob_flush();
    
        } catch (PDOException $e){
            print_r("Error saving album to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    }

?>
<?php
class Biome{
  private $biomes_id;
  private $name;
  private $climate;
  private $location;

  public function __construct($_name='', $_climate='', $_location=''){
    if(empty($_name)) return false;

      $this->name = $_name;
      $this->climate = $_climate;
      $this->location = $_location;

      //read a biome from the database
   public static function read($biomes_id){
        global $db;

        if($db){
          $q = $db->prepare('SELECT * FROM `Biome` WHERE biomes_id = ?');
          $q->execute(array($biomes_id));
          if($item = $q->fetch()){
            $biome = new Biome($item['name'], $item['climate'], $item['location']);
            $biome->set$biomes_iD($item['$biomes_id']);
            return $item;
          }
        }
        return false;
      }

      //save to the database
      public function create(){
        global $db;

        //Make sure we have a database to talk to
        if($db){
          $db->beginTransaction();
          $q = $db->prepare('INSERT INTO `biome` (name, climate, location) VALUES (?, ?, ?)');
          try{
            $q->execute(array($this->name, $this->climate, $this->location));
          } catch(PDOException $e) {
            print_r($e);
            $db->rollback();
            return false;
          }
          $this->biomes_iD = $db->lastInsertbiomes_iD();
          $db->commit();
          return true;
        }
        return false;
      }
// lets see if this updates
    public function update(){
		global $db;

  	if($db){
 		$db->beginTransaction();
		$stmt = 'UPDATE Biome SET ';
			$stmt.= 'biomes_id = "'.$this->biomes_id.'", ';
			$stmt.= 'name = "'.$this->name.'", ';
			$stmt.= 'climate = "'.$this->climate.'", ';
		 $stmt.= 'location= "'.$this->location.'", ';
		$q = $db->prepare($stmt);
		try{
				$q->execute();
		} catch(PDOException $e) {
				print_r($e);
			$db->rollback();
			return false;
			}
			$db->commit();
			return true;
		}
	return false;
	}
      }


      //Delete
      	public function delete(){
      		global $db;
      	if($db){
      			$db->beginTransaction();
      			$q = $db->prepare('DELETE FROM 'Biome' WHERE biomes_IDd = ?');
      		try{
      			$q->execute(array($this->biomes_id));
      			} catch(PDOException $e) {
      			print_r($e);
      				$db->rollback();
      			return false;
      		}
      		$db->commit();
      			return true;
      	  	}
      		return false;
      	}
      //Get a list of all biome names and IDs.
       public static function biome_list(){
        global $db;
        if($db){
          $db->beginTransaction();
        print("PDO::fetchAll: ");
        print("Return next row as an array indexed by column name\n");
        $q = $db->prepare('SELECT * FROM `biome` WHERE biomes_id = ?');
        $result = $q->fetchAll(PDO::FETCH_ASSOC);
        print_r($result);
        print("\n");
      }

    }

      //Find a list of biomes matching a certain name.
      public static function find($target){
       global $db;
       if($db){
		   $stmt = 'SELECT * FROM Biome WHERE name like " '.$this->name.' "';
		   $q = $db->prepare($stmt);
	  	 $q->execute();
					$result=$q->fetchAll();
		}
		return $result;
	}
      }

      //These are all standard getters and setters
      public function setBiomes_iD($newBiomes_ID){
        if(empty($newBiomes_ID)) return false;

        $this->bBiomes_ID = $newBiomes_ID;
        return $this->bBiomes_ID;
      }

      public function getBiomes_ID(){
        return $this->Biomes_ID;
      }
      public function setName($newName){
        if(empty($newName)) return false;

        $this->Name = $newName;
        return $this->Name;
      }

      public function getName(){
        return $this->Name;
      }
      public function setClimate($newClimate){
        if(empty($newClimate)) return false;

        $this->Climate = $newClimate;
        return $this->Climate;
      }

      public function getClimate(){
        return $this->Climate;
      }

      public function setLocation($newLocation){
        if(empty($newLocation)) return false;

        $this->Location = $newLocation;
        return $this->Location;
      }

      public function getLocation(){
        return $this->Location;
      }



}

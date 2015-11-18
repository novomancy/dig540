<?php
//Creature.php

class Monster{
	private $id;
	private $creature_name;
	private $food_source;
	private $power;
	private $venom;
	private $mortality;
	private $adult_height;
	private $adult_weight;
	public $text;
  		
	public function __construct($_id='', $_creature_name='', $_food_source='', $_power='', $_venom='', $_mortality='', $_adult_height='', $_adult_weight=''){
	$this->text ='In Creature.php';
		
	$this->id = $_id;
    	$this->creature_name = $_creature_name;
    	$this->food_source = $_food_source;
    	$this->power = $_power;
    	$this->venom = $_venom;
    	$this->mortality = $_mortality;
    	$this->adult_height = $_adult_height;
    	$this->adult_weight = $_adult_weight; 	
	}


//Return a list of Creatures and their IDs
	public static function creature_list(){
		global $db;
		
		if($db){
			$q = $db->prepare("SELECT * FROM creature");
			$q->execute();
	
			$result = $q->fetchAll();
		}
		return $result;
	}

//Read
	public static function read($pid){
		global $db;

		if($db){
			$q = $db->prepare('SELECT * FROM creature WHERE id = ?');
			$q->execute(array($pid));
			
			if ($result=$q->fetch()){
				$creature = new Monster($pid, $result['creature_name'], $result['food_source'], $result['power'], $result['venom'], $result['mortality'], $result['adult_height'], $result['adult_weight']);
			}
		}
		
		return $creature;
	}  

//Create
	public function create(){
		global $db;

		if($db){

			$db->beginTransaction();
			$q = $db->prepare('INSERT INTO creature (creature_name, food_source, power, venom, mortality, adult_height, adult_weight) VALUES (?, ?, ?, ?, ?, ?, ?)');
			try{
        			$q->execute(array($this->creature_name, $this->food_source, $this->power, $this->venom, $this->mortality, $this->adult_height, $this->adult_weight));
        		} catch(PDOException $e) {
				print_r($e);
				$db->rollback();
				return false;
			}
			$this->id = $db->lastInsertId();
			$db->commit();
			return true;
		}
		return false;
	}

//Delete
	public function delete(){
		global $db;
	
		if($db){
			$db->beginTransaction();
			$q = $db->prepare('DELETE FROM creature WHERE id = ?'); 
			try{
				$q->execute(array($this->id));
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

//Update	
	public function update(){
		global $db;
	
		if($db){
			$db->beginTransaction();
			$stmt = 'UPDATE creature SET ';
			$stmt.= 'creature_name = "'.$this->creature_name.'", ';
			$stmt.= 'food_source = "'.$this->food_source.'", ';
			$stmt.= 'power = "'.$this->power.'", ';
			$stmt.= 'venom = "'.$this->venom.'", ';
			$stmt.= 'mortality = "'.$this->mortality.'", ';
			$stmt.= 'adult_height = '.$this->adult_height.', ';
			$stmt.= 'adult_weight = '.$this->adult_weight;
			$stmt.= ' WHERE id = '.$this->id;

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

//Search -> Return a list of Creatures matching a specific Creature Name

	public function find(){
		global $db;

		if($db){
			$stmt = 'SELECT * FROM creature WHERE creature_name like "%'.$this->creature_name.'%"';
			$q = $db->prepare($stmt);
			$q->execute();
			
			$result=$q->fetchAll();
		}		
		return $result;
	}
  
//Getters & Setters

	public function setID($newID){
		if(empty($newID)) return false;
		$this->id = $newID;
		return $this->id;
	}
	
	public function getID(){
		return $this->id;
	}
	
	public function setCreature_Name($newCreature_Name){
		if(empty($newCreature_Name)) return false;
		$this->creature_name = $newCreature_Name;
		return $this->creature_name;
	}
	
	public function getCreature_Name(){
		return $this->creature_name;
	}	
	
	public function setFood_Source($newFood_Source){
		if(empty($newFood_Source)) return false;
		$this->food_source = $newFood_Source;
		return $this->food_source;
	}
	
	public function getFood_Source(){
		return $this->food_source;
	}	

	public function setPower($newPower){
		if(empty($newPower)) return false;
		$this->power = $newPower;
		return $this->power;
	}
	
	public function getPower(){
		return $this->power;
	}
	
	public function setVenom($newVenom){
		if(empty($newVenom)) return false;
		$this->venom = $newVenom;
		return $this->venom;
	}
	
	public function getVenom(){
		return $this->venom;
	}

	public function setMortality($newMortality){
		if(empty($newMortality)) return false;
		$this->mortality = $newMortality;
		return $this->mortality;
	}
	
	public function getMortality(){
		return $this->mortality;
	}

	public function setAdult_Height($newAdult_Height){
		if(empty($newAdult_Height)) return false;
		$this->adult_height = $newAdult_Height;
		return $this->adult_heigth;
	}
	
	public function getAdult_Height(){
		return $this->adult_height;
	}
		public function setAdult_Weight($newAdult_Weight){
		if(empty($newAdult_Weight)) return false;
		$this->adult_weight = $newAdult_Weight;
		return $this->adult_weight;
	}
	
	public function getAdult_Weight(){
		return $this->adult_weight;
	}
}
?>
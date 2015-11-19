<?php
class Contributor{
  private $id;
  private $name;
  private $born;
  private $died;

//Enter a new contributor into the database
public function _construct($_name, $_born, $_died=''){
  if(empty($_name))return false;

  $this->name = $_name;
  $this->born = $_born;
  $this->died = $_died;
  }

//Static function: Method to call data out of database & create php object

public static function read($id){
  global $db;

  if($db){
    $query = $db->prepare('SELECT * FROM `contributor` WHERE id = ?');
    $query->execute(array($id));
    if($item = $query->fetch()){
      $contributor = new Contributor($item[`name`], $item[`born`], $item[`died`]);
      $contributor->setID($item[`id`]);
      return $contributor;
    }
  }
  return false;
}

public function create(){
  global $db;

  if($db){
    $db->beginTransaction();
    $query = $db->prepare('INSERT INTO `contributor` (name, born, died) VALUES (?, ?, ?)');
    try{
      $query->execute(array($this->name, $this->born, $this->died));
    }
    catch(PDOException $e){
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

//Update function

public function update(){
  global $db

  if($db){
    $db->beginTransaction();
    $query = $db->prepare('UPDATE * FROM `contributor` (name, born, died) WHERE `id` = (?, ?, ?)');
  try{
      $query->execute(array($this->name, $this->born, $this->died;
    }
  catch(PDOException $e){
      print_r($e);
      $db->rollback();
    }
    $this->id = $db->rrd_lastupdate();
    $db-.commit();
    return true;
    }
  return false;
      }

//Delete function

public function delete(){
  global $db

  if($db){
    $db->beginTransaction();
    $query = $db->prepare('DELETE FROM `contributor` (name, born, died) WHERE `id` = (?, ?, ?) LIMIT 1;;');
  try{
      $query->execute(array($this->name, $this->born, $this->died;
    }
    catch(PDOException $e){
      print_r($e);
      $db->rollback();
    }
    $this->id = $db->rowCount();
      return false;
      }
      $this->id
  }
}

//Fetchall to create list of all composers

public static function contributor_list(){
  foreach($name->FetchAll() as $name){
    echo $name[`name`].`<br />`;
  }
}

//Find a specific composer by name  (fetchall?)

public static function find($target){
  if(
}



//Set & get id

public function setID($newID){
  if(empty($newID)) return false;
  $this->id = $newID;
  return $this->id;
}
public function getID(){
  return $this->id;
}

//Set & get name

public function setName($newName){
  if (empty($newName)) return false;
  $this->name = $newName;
  return $this->name;
}
public function getName($newName){
  return $this->name;
}

//Set & get birth date

public function setBorn($newBorn){
  if (empty($newBorn)) return false;
  $this->born = $newBorn;
  return $this->born;
}
public function getBorn($newBorn){
  return $this->born;
}

//Set & get death date

public function setDied($newDied){
  if (empty($newDied)) return false;
  $this->died = $newDied;
  return $this->died;
}
public function getDied($newDied){
  return $this->died;
}

}

 ?>

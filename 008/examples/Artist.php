<?php
class Artist{
  private $id;
  private $name;
  private $origin;
  private $active_years;

  //creating a new artist. Note that we don't set ID
  public function __construct($_name, $_origin='', $_active_years=''){
    if(empty($_name)) return false;

    $this->name = $_name;
    $this->origin = $_origin;
    $this->active_years = $_active_years;
  }

  //read an artist from the database
  public static function read($id){
    global $db;

    if($db){
      $q = $db->prepare('SELECT * FROM `artist` WHERE id = ?');
      $q->execute(array($id));
      if($item = $q->fetch()){
        $artist = new Artist($item['name'], $item['origin'], $item['active_years']);
        $artist->setID($item['id']);
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
      $q = $db->prepare('INSERT INTO `artist` (name, origin, active_years) VALUES (?, ?, ?)');
      try{
        $q->execute(array($this->name, $this->origin, $this->active_years));
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

  public function update(){
    //fill in the blanks
  }

  public function delete(){
    //fill in the blanks
  }

  //Get a list of all artist names and IDs. HINT: there is a method in PDO
  //called fetchAll that is kind of like fetch...
  public static function artist_list(){
    //fill in the blanks
  }

  //Find a list of artists matching a certain name. HINT: fetchAll is useful...
  public static function find($target){

  }

  //These are all standard getters and setters
  public function setID($newID){
    if(empty($newID)) return false;

    $this->id = $newID;
    return $this->id;
  }

  public function getID(){
    return $this->id;
  }

  public function setYears($newYears){
    if(empty($newYears)) return false;

    $this->active_years = $newYears;
    return $this->active_years;
  }

  public function getYears(){
    return $this->active_years;
  }

  public function setOrigin($newOrigin){
    if(empty($newOrigin)) return false;

    $this->origin = $newOrigin;
    return $this->origin;
  }

  public function getOrigin(){
    return $this->origin;
  }

  public function setName($newName){
    if(empty($newName)) return false;

    $this->name = $newName;
    return $this->name;
  }

  public function getName(){
    return $this->name;
  }
}
?>

<?php
class Album{
  private $id;
  private $album_title;
  private $date;
  private $format;
  public function __construct($_album_title, $_date='', $_format=''){
    if(empty($_album_title)) return false;
    $this->album_title = $_album_title;
    $this->date = $_date;
    $this->format = $_format;
  }
  public static function read($id){
    global $db;
    if($db){
      $q = $db->prepare('SELECT * FROM `album` WHERE id = ?');
      $q->execute(array($id));
      if($item = $q->fetch()){
        $album = new Album($item['album_title'], $item['date'], $item['format']);
        $album->setID($item['id']);
        return $item;
      }
    }
    return false;
  }
  public function create(){
    global $db;
    if($db){
      $db->beginTransaction();
      $q = $db->prepare('INSERT INTO `album` (album_title, date, format) VALUES (?, ?, ?)');
      try{
        $q->execute(array($this->album_title, $this->date, $this->format));
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
    global $db;
      if($db){
      $db->beginTransaction();
      $q = $db->prepare('UPDATE `album` (album_title, date, format) VALUES (?, ?, ?)');
      try{
        $q->execute(array($this->album_title, $this->date, $this->format));
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
  public function delete(){
    global $db;
      if($db){
      $db->beginTransaction();
      $q = $db->prepare('DELETE FROM `album` (album_title, date, format) VALUES (?, ?, ?)');
      try{
        $q->execute(array($this->album_title, $this->date, $this->format));
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
  public static function artist_list(){
    global $db;
    if($db){
      $q = $db->prepare('SELECT album_name, id FROM `album`');
      $q->execute();
      $result = $q->fetchAll();
      print_r ($result);
      }
    }
  public static function find($target){
    global $db;
    if($db){
      $q = $db->prepare('SELECT album_name FROM `album` WHERE album_name = ?');
      $q->execute();
      $result = $q->fetchAll();
      print_r ($result);
      }
  }
  public function setID($newID){
    if(empty($newID)) return false;
    $this->id = $newID;
    return $this->id;
  }
  public function getID(){
    return $this->id;
  }
  public function setTitle($newTitle){
    if(empty($newTitle)) return false;
    $this->album_title = $newTitle;
    return $this->album_title;
  }
  public function getTitle(){
    return $this->album_title;
  }
  public function setDate($newDate){
    if(empty($newDate)) return false;
    $this->date = $newDate;
    return $this->date;
  }
  public function getDate(){
    return $this->date;
  }
  public function setFormat($newFormat){
    if(empty($newFormat)) return false;
    $this->format = $newFormat;
    return $this->format;
  }
  public function getFormat(){
    return $this->format;
  }
}
?>

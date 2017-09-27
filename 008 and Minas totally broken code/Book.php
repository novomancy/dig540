<?php
class  Book{
  public $bookid;
  public $book_title;
  public $book_num;
  public $story_serial;
  public $story_serial_number;

  //creating a new book. Note that we don't set ID
  public function __construct($_book_title='', $_book_num='', $_story_serial='', $_story_serial_number=''){
    if(empty($_book_title)) return false;

    $this->book_title = $_book_title;
    $this->book_num = $_book_num;
    $this->story_serial = $_story_serial;
    $this->story_serial_number = $_story_serial_number;
  }

  //read an artist from the database
  public static function read($bookid){
    global $db;

    if($db){
      $q = $db->prepare('SELECT * FROM `Book` WHERE bookid = ?');
      $q->execute(array($bookid));
      if($item = $q->fetch()){
        $book = new Book($item['book_title'], $item['book_num'], $item['story_serial'], $item['story_serial_number']);
        $book->setID($item['bookid']);
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
      $q = $db->prepare('INSERT INTO `Book` (book_title, book_num, story_serial, story_serial_number) VALUES (?, ?, ?, ?)');
      try{
        $q->execute(array($this->book_title, $this->book_num, $this->story_serial, $this->story_serial_number));
      } catch(PDOException $e) {
        print_r($e);
        $db->rollback();
        return false;
      }
      $this->bookid = $db->lastInsertId();
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
  public static function book_list(){
    //fill in the blanks
  }

  //Find a list of artists matching a certain name. HINT: fetchAll is useful...
  public static function find($target){

  }

  //These are all standard getters and setters
  public function setID($newID){
    if(empty($newID)) return false;

    $this->bookid = $newID;
    return $this->bookid;
  }

  public function getID(){
    return $this->bookid;
  }

  public function setTitle($newTitle){
    if(empty($newTitle)) return false;

    $this->book_title = $newTitle;
    return $this->book_title;
  }

  public function getTitle(){
    return $this->book_title;
  }

  public function setBook_num($newBook_num){
    if(empty($newBook_num)) return false;

    $this->book_num = $newBook_num;
    return $this->book_num;
  }

  public function getBook_num(){
    return $this->book_num;
  }

  public function setStory_serial($newStory_serial){
    if(empty($newStory_serial)) return false;

    $this->story_serial = $newStory_serial;
    return $this->story_serial;
  }

  public function getStory_serial(){
    return $this->story_serial;
  }

  public function setStory_serial_number($newStory_serial_number){
    if(empty($newStory_serial_number)) return false;

    $this->story_serial_number = $newStory_serial_number;
    return $this->story_serial_number;
  }

  public function getStory_serial_number(){
    return $this->story_serial_number;
  }
}
?>

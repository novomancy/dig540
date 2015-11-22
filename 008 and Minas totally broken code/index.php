<?php
require_once('config.php');
require_once('Book.php');

if(isset($_POST['submit'])){
  $Book = new Book($_POST['book_title'], $_POST['book_num'], $_POST['story_serial'], $_POST['story_serial_number']);
  $Book->create();
}
?>

<html>
  <head>
    <title>Books</title>
<style>
  h1 {
    text-align:center;
  }
  p {
    font-size: 22px;
    font-weight: bold;
    text-align: center;
  }
  .divI {
    border-radius: 15px;
    background: #5992A6;
    padding: 15px;
    width: 915px;
    font-size: 22px;
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  .divO {
    border-radius: 15px;
    background: #B0C4DE;
    padding: 15px;
    width: 975px;
    font-size: 22px;
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  lable {
    display: inline-block;
    float: left;
    clear: left;
    width: 600px;
    text-align: right;
  }
  .ifield {
    display: inline-block;
    float: left;
    font-size: 22px;
    border: 1 none;
    width: 300px;
  }
  .sbutton {
    font-size: 25px;
    padding: 8px 20px;
    background #ccc;
    border: 1 none;
    border-radius: 5px;
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  </style>
</head>
  <body>
    <h1>The Discworld Book DB</h1>
    <div class="divI">
      <u><h3>Add a new book to the database</h3></u><br>
    <form method="POST" action="">
      <lable>Enter the book title:</lable>
      <input type="text" name="book_title" class="ifield"></input><br>
        <lable>Enter the book number in the Discworld series:</lable>
      <input type="text" name="book_num" class="ifield"></input><br>
          <lable>Enter the book's category:</lable>
      <input type="text" name="story_serial" class="ifield"></input><br>
        <lable>Enter the number in the book's order of publication in it's category:</lable>
      <input type="text" name="story_serial_number" class="ifield"></input><br><br>
      <input type="submit" name="submit" value="submit" class="sbutton"></input>
    </form>
  <br>

    </div>
<br>
<br>
    <div class="divO">
      <?php if(isset($Book)) { ?>
        <p>The last book entered was "<?php echo $Book->book_title; ?>". It was given ID <?php echo $Book->bookid ?> in the database.</p>
          <?php } else {
            $Book = Book::read(1);
          ?>
          <p>The first book entered was "<?php echo $Book->book_title; ?>". It was given ID <?php echo $Book->bookid ?> in the database.</p>
          <?php } ?>
    </div>
  </body>
</html>

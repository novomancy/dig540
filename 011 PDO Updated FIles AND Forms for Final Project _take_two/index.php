<?php
require_once('config.php');
require_once('Book.php');

if(isset($_POST['submit'])){
  $Book = new Book($_POST['book_title'], $_POST['book_num'], $_POST['story_serial'], $_POST['story_serial_number']);
  $Book->create();
}
elseif(isset($_POST['update'])){
  $Book = new Book($_POST['book_title'], $_POST['book_num'], $_POST['story_serial'], $_POST['story_serial_number']);
  $Book->update();
}
elseif(isset($_POST['delete'])){
  $Book = new Book($_POST['book_title']);
  $Book->delete();
}
elseif(isset($_POST['booklist'])){
  $Book = new Book();
  $Books = $Book->book_list();
}

/*
elseif(isset($_POST['find'])){
  $Book = new Book();
  $Books = $Book->find();
}
*/

/*
//Fatal error: Call to undefined method PDO::fetchAll()
//Create list to populate drop-down box in the form in index.php
    if($db){
      $db->beginTransaction();
      $q = $db->prepare('SELECT book_title FROM Book ');
			try{
        $q->execute();
      } catch(PDOException $e) {
        print_r($e);
        $db->rollback();
        return false;
      }
			$list_results = $db->fetchAll();
			return $list_results;
		} */


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
    width: 615px;
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

    <u><h3>Update the information of a book in the database</h3></u><br>
    <form method="POST" action="">
      <lable>Enter the title of the book to update:</lable>

      <!-- This is supposed to populate a drop-down box with the
      book_title column. It doesn't work. Grr...
      <//?php if ($db->rowCount() > 0) { ?>
        <select name="book_title">
          <//?php foreach ($list_results as $row) : ?>
            <option value="<//?php echo $row['book_title']; ?>"><//?php echo $row['book_title']; ?></option>
          <//?php endforeach; ?>
        </select>
      <//?php } ?> -->

      <input type="text" name="book_title" class="ifield"></input><br>
      <lable>Update the book number in the Discworld series:</lable>
      <input type="text" name="book_num" class="ifield"></input><br>

      <lable>Update the book's category:</lable>
      <input type="text" name="story_serial" class="ifield"></input><br>

      <lable>Update the number in the book's order of publication in it's category:</lable>
      <input type="text" name="story_serial_number" class="ifield"></input><br><br>

      <input type="submit" name="update" value="update" class="sbutton"></input>
    </form>
    <br>

    <u><h3>Delete a book from the database</h3></u><br>
    <form method="POST" action="">
      <lable>Enter the title of the book to delete:</lable>
      <input type="text" name="book_title" class="ifield"></input><br>

      <input type="submit" name="delete" value="delete" class="sbutton"></input>
    </form>
    <br>

    <u><h3>List all books in the database by ID and Title</h3></u><br>
    <form method="POST" action="">
      <lable>Click on the booklist button for a list of all books in the database</lable>
      <input type="submit" name="booklist" value="booklist" class="sbutton"></input>
    </form>

    <!-- <u><h3>Find a book in the database</h3></u><br>
    <form method="POST" action="">
      <lable>Enter the title of the book to search for:</lable>
      <input type="text" name="book_title" class="ifield"></input><br>

      <input type="submit" name="find" value="find" class="sbutton"></input>
    </form> -->
    <br>
    </div>
    <br>
    <br>

    <div class="divO">
      <?php if(isset($_POST['submit'])){ ?>
        <?php if(isset($Book)) { ?>
          <p>The last book entered was "<?php echo $Book->book_title; ?>". It was given ID <?php echo $Book->bookid ?> in the database.</p>
          <?php } else {
            $Book = Book::read(1); ?>
          <p>The first book entered was "<?php echo $Book->book_title; ?>". It was given ID <?php echo $Book->bookid ?> in the database.</p>
          <?php } ?>

      <?php } elseif(isset($_POST['update'])){ ?>
        <?php if(isset($Book)) { ?>
          <p>The information for Book: "<?php echo $Book->book_title, $Book->book_num, $Book->story_serial, $Book->story_serial_number; ?>" has been updated in the database.</p>
          <?php } else { ?>
            <p>No records have been updated. Please enter a valid Book Title and try again. Thanks!</p>
        <?php } ?>

        <?php } elseif(isset($_POST['delete'])){ ?>
          <?php if(isset($Book)) { ?>
            <p>The Book: "<?php echo $Book->book_title; ?>" has been deleted from the database.</p>
            <?php } else { ?>
              <p>No records have been deleted. Please enter a valid Book Title and try again. Thanks!</p>
          <?php } ?>

          <?php } elseif(isset($_POST['booklist'])){ ?>
            <?php if(isset($Books)) { ?>
              <table>
                <tr>
                  <th>Book ID &#35;</th>
                  <th>Book Title</th>
                </tr>
                <?php foreach ($Books as $row) { ?>
                  <?php echo "<tr>"; ?>
                  <?php echo "<td>".$row['bookid']."</td>"; ?>
                  <?php echo "<td>".$row['book_title']."</td>"; ?>
                  <?php echo "</tr>"; ?>
                <?php } ?>
                <?php echo "</table>"; ?>
              <?php } else { ?>
                <p>No books listed. </p>
            <?php } ?>

        <!--    </?php } elseif(isset($_POST['find'])){ ?>
              </?php if(isset($Books)) { ?>
                <table>
                  <tr>
                    <th>Matching Book Title</th>
                  </tr>
                  </?php foreach ($Books as $row) { ?>
                    </?php echo "<tr>"; ?>
                    </?php echo "<td>".$row['book_title']."</td>"; ?>
                    </?php echo "</tr>"; ?>
                  </?php } ?>
                  </?php echo "</table>"; ?>
                </?php } else { ?>
                  <p>No books listed. </p>
              </?php } ?> -->

            <?php } else { ?>
            <p></p>
          <?php } ?>

    </div>

  </body>
</html>

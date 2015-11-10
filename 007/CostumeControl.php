

<html>
  <head>
    <title>Costume</title>
  </head>
  <body>
    <?php
    require_once('CostumeModel.php');
    require_once('CostumeView.php');
    if(isset($_POST['costume']) && $_POST['costume'] != ''){
      $myCostume = new Costume();
      $myCostume->setCostume($_POST['costume']);
    }

    if(isset($_POST['name']) && $_POST['name'] != ''){
      $myName = new Name();
      $myName->setName($_POST['name']);
}

{echo $_POST["costume"];
 echo " is an awesome costume, ";
 echo $_POST["name"];
}


   ?>

 </body>
 </html>

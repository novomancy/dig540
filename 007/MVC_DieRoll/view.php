<!DOCTYPE html>
<html>
<!-- This is the Viewer; it contains the HTML for display and output. -->

	<head>
		<title>Dice Roll 21</title>
	</head>
	
	<body>

<?php
include_once( 'model.php' );
include_once( 'controller.php' );
$model = new Model();
$controller = new Controller ($model);

?>

	<h1>Try your luck!</h1><a href="https://pixabay.com/en/dice-games-game-six-sided-face-26772/" target="_blank">
	<img src="dice_row.png" height="107.5" width="640"></a>
	<form method="POST" action="">
		How many rolls will result in a perfect 21? <input type="text" name="dieroll" size="3">
		&nbsp;&nbsp;
  		<input type="submit" value="Roll the die">
  		<br /><br />
	</form>	

<?php

$form_val = $_POST['dieroll'];
if ($form_val != ''){
	if (is_numeric($form_val)){
		if(!filter_var($form_val, FILTER_VALIDATE_INT)===false){
			echo 'Feeling lucky?<br /> ';
			ob_flush();
			sleep(2);
			
			$result=$controller->rollDie($_POST['dieroll']);
			echo $controller->htmlStr;

			if ($result < 21){
				echo '<br /> <br /> <h1>Too low. You lose!</h1>';
			} elseif ($result == 21) {
				echo '<br /> <br /> <h2>Winner!</h2>';
			} else {
				echo '<br /> <br /> <h1>Too high. You lose!</h1>';
			}

		} else {
			echo 'Please enter an integer.<br /> ';
		}
	} else {
		echo 'Please enter a number.<br /> ';
		
	}
}	

?>		
		

	</body>	
</html>
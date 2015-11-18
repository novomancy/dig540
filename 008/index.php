<?php
//Index.php

require_once('config.php');
require_once('creatures.php');

  
if($_POST['create']){
	//echo " Create ";
	$c_monster = new Monster(NULL, $_POST['creature_name'], $_POST['food_source'], $_POST['power'], $_POST['venom'], $_POST['mortality'], $_POST['adult_height'], $_POST['adult_weight']);
	$c_monster->create();
	//echo " Created ID: ".$c_monster->getID();
}
elseif($_POST['r_update']){
	//echo " Pre Update ";
	$monster = new Monster();
	$u_monster = $monster->read($_POST['u_id']);
	echo $u_monster->getCreature_Name();
}
elseif($_POST['update']){
	//echo " Update ";
	$monster = new Monster($_POST['u_id'], $_POST['u_creature_name'], $_POST['u_food_source'], $_POST['u_power'], $_POST['u_venom'], $_POST['u_mortality'], $_POST['u_adult_height'], $_POST['u_adult_weight']);
	$monster->update();
}
elseif($_POST['delete']){
	//echo " Delete ";
	$monster = new Monster($_POST['d_id']);
	$newmonster = $monster->delete();
}
elseif($_POST['search']){
	//echo " Search ";
	//echo $_POST['f_creature_name'];
	$monster = new Monster(null, $_POST['f_creature_name']);
	$monsters = $monster->find();
}
elseif($_POST['list']){
	//echo " List ";
	$monster = new Monster();
	$monsters = $monster->creature_list();
}
else{
	//echo " No button pushed ";
}

?>

<html>

	<head>
		<title>Mythical Creatures</title>
	</head>
  
	<body>
	
	<form method="POST" action="">

	<h1><a href="https://pixabay.com/p-350071/?no_redirect" target="_blank">
	<img src="dragon.png" height="80" width="80"></a>Mythical Creatures: a Database</h1>
	
	<table>
	<tr>	
		<td><a href="#create">Create a Creature</a><br>
		<a href="#update">Update a Creature</a><br>
		<a href="#delete">Delete a Creature</a><br><br></td>
	</tr>

	<tr>
		<td> Need to review all creatures in the database?&nbsp;&nbsp;<input type="submit" name="list" id="list" value="list all creatures" /></td>
	</tr>
	<br><br>
	<tr>
		<td>What is the name of the creature you seek?&nbsp;&nbsp;&nbsp;<input type="text" name="f_creature_name" /></td>
		<td><input type="submit" name="search" id="search" value="search creatures" /></td>
	</tr>
	</table>
	<table>
	
	<br /><br />

	<?php
		$htmlStr = '';
				
		if(isset($monsters)){ 
	?>
	
	<tr>
		<th>ID&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<th>Creature Name&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<th>Food Source&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<th>Power&nbsp;&nbsp;&nbsp;</th>
		<th>Venom&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<th>Mortality&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<th>Height&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<th>Weight&nbsp;&nbsp;&nbsp;&nbsp;</th>
	</tr> 
	
	<?php
		foreach ($monsters as $cre){
				$htmlStr.='<tr>'; 
				$htmlStr.='<td>'.$cre["id"].'</td>';
				$htmlStr.='<td>'.$cre["creature_name"].'</td>';
				$htmlStr.='<td>'.$cre["food_source"].'</td>';
				$htmlStr.='<td>'.$cre["power"].'</td>';
				$htmlStr.='<td>'.$cre["venom"].'</td>';
				$htmlStr.='<td>'.$cre["mortality"].'</td>';
				$htmlStr.='<td>'.$cre["adult_height"].'</td>';
				$htmlStr.='<td>'.$cre["adult_weight"].'</td>';
				$htmlStr.='</tr>';
			}
		}
		echo $htmlStr;
	?>

	
	</table>

 		<h3><a name="update">Which Creature should be Updated?</a></h3>

		Enter the creature&#39;s ID to update.&nbsp;
		<input type="text" name="u_id"></input>
		<input type="submit" name="r_update" id="update" value="get creature" />
		<br />Need the ID? Click <i>list all creatures</i>.<br /><br />

<?php		if(isset($u_monster)){				?>

		<input type="hidden" name="u_id" value="<?php echo $u_monster->getID(); ?>" />

		<p><b>Which facts should be updated?</b></p><br />

		What is the name of the mythical creature?
		<input type="text" name="u_creature_name" value="<?php echo $u_monster->getCreature_Name(); ?>"></input><br /><br />

		What does the creature eat?
		<input type="text" name="u_food_source" value="<?php echo $u_monster->getFood_Source(); ?>"></input><br /><br />
      
		Does the creature have any extraordinary powers?
		<input type="text" name="u_power" value="<?php echo $u_monster->getPower(); ?>"></input><br /><br />
		
		Does the creature have venom? What kind?
		<input type="text" name="u_venom" value="<?php echo $u_monster->getVenom(); ?>"></input><br /><br />
		
		How can the creature be killed?
		<input type="text" name="u_mortality" value="<?php echo $u_monster->getMortality(); ?>"></input><br /><br />
		
		What is the creature&#39;s maximum height (in feet)?
		<input type="text" name="u_adult_height" value="<?php echo $u_monster->getAdult_Height(); ?>"></input><br /><br />
		
		What is the creature&#39;s maximum weight (in pounds)?
		<input type="text" name="u_adult_weight" value="<?php echo $u_monster->getAdult_Weight(); ?>"></input><br /><br />
		
		<input type="submit" name="update" id="update" value="update creature" />

<?php		}						?>


		<h3><a name="delete">Delete a Creature</a></h3>
		
		Enter the creature&#39;s ID to delete.&nbsp;&nbsp;
		<input type="text" name="d_id"></input>
		<input type="submit" name="delete" id="delete" value="delete creature" />
		<br />Need the ID? Click <i>list all creatures</i>.<br /><br />


  		<h3><a name="create">Create a New Creature</a></h3>
<?php
		if(isset($c_monster)){
			echo "<h3>You have created a monster!</h3>";
			echo "The new creature&#39;s name is: ".$c_monster->getCreature_Name()."<br/>";
			echo "And the new creature&#39;s ID is: ".$c_monster->getID()."<br/><br/>";
			
			echo "Would you like to create another creature? Please enter the information below.<br/><br/>";
		}
?>


		What is the name of the mythical creature?
		<input type="text" name="creature_name"></input><br /><br />
      
		What does the creature eat?
		<input type="text" name="food_source"></input><br /><br />
      
		Does the creature have any extraordinary powers?
		<input type="text" name="power"></input><br /><br />
		
		Does the creature have venom? What kind?
		<input type="text" name="venom"></input><br /><br />
		
		How can the creature be killed?
		<input type="text" name="mortality"></input><br /><br />
		
		What is the creature&#39;s maximum height (in feet)?
		<input type="text" name="adult_height"></input><br /><br />
		
		What is the creature&#39;s maximum weight (in pounds)?
		<input type="text" name="adult_weight"></input><br /><br />

		<input type="submit" name="create" id="create" value="create creature" /><br /><br />
		
	</form>

	</body>

</html>
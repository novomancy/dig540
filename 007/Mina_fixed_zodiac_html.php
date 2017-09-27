<?php

	require_once('Mina_Starsign_class.php');


	$zodiac = array();//stored locally

	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/6/69/Aries2.jpg', 'Aries', 'Mar 21', 'Apr 19', 'Aries is a Fire Sign, ruled by Mars.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Taurus2.jpg/220px-Taurus2.jpg', 'Taurus', 'Apr 20', 'May 20', 'Taurus is an Earth Sign, ruled by Venus.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Gemini2.jpg/220px-Gemini2.jpg', 'Gemini', 'May 21', 'Jun 20', 'Gemini is an Air Sign, ruled by Mercury.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Cancer2.jpg/220px-Cancer2.jpg', 'Cancer', 'Jun 21', 'Jul 22', 'Cancer is a Water Sign, ruled by the Moon.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Leo2.jpg/220px-Leo2.jpg', 'Leo', 'Jul 22', 'Aug 22', 'Leo is a Fire Sign, ruled by the Sun.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Virgo2.jpg/220px-Virgo2.jpg', 'Virgo', 'Aug 23', 'Sep 22', 'Virgo is an Earth Sign, ruled by Mercury.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Libra2.jpg/220px-Libra2.jpg', 'Libra', 'Sep 23', 'Oct 22', 'Libra is an Air Sign, ruled by Venus.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Scorpio2.jpg/220px-Scorpio2.jpg', 'Scorpio', 'Oct 23', 'Nov 21', 'Scorpio is a Water Sign, ruled by Pluto.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Sagittarius2.jpg/220px-Sagittarius2.jpg', 'Sagittarius', 'Nov 22', 'Dec 21', 'Sagittarius is a Fire Sign, ruled by Jupiter.'));
	//array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/6/64/Capricorn2.jpg', 'Capricorn', 'Dec 23', 'Jan 19', 'Capricorn is an Earth Sign, ruled by Saturn.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Aquarius2.jpg/220px-Aquarius2.jpg', 'Aquarius', 'Jan 20', 'Feb 18', 'Aquarius is a Water Sign, ruled by Uranus.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Pisces2.jpg/220px-Pisces2.jpg', 'Pisces', 'Feb 19', 'Mar 20', 'Pisces is a Water Sign, ruled by Neptune.'));
	array_push($zodiac, new StarSign('https://upload.wikimedia.org/wikipedia/commons/6/64/Capricorn2.jpg', 'Capricorn', 'Jan 1', 'Dec 31', 'Capricorn is an Earth Sign, ruled by Saturn.'));

	$months = array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

	$days = 31;
	$image = '';
	$horoscope = "Enter your birthday to discover your fortune.";

	 if(isset($_POST['submit'])) {
		 $target = $_POST['month'].' '.$_POST['day'];
		 $date_num = date("z", strtotime($target));
		 for($i=0; $i<count($zodiac); $i++){
			  if($zodiac[$i]->is_in_range($date_num)){
				 $horoscope = $zodiac[$i]->get_horoscope();
				 $image = $zodiac[$i]->get_image();
				 break;
			 }
		 }
	 }
?>

<html>
	<head>
		<title> Welcome to your Future </title>
	</head>
		<body>
		<form action="" method="post">
			<div>
			Enter your birthday to receive your fortune: </br></br>
			</div>
				<select name="month">
					<?php

						for($i=0; $i<count($months); $i++){
						echo '<option value="'.$months[$i].'"> '.$months[$i].'</option>';
						}
						?></br></br>
				</select>

				<select name="day">
					<?php

					for($i=1; $i<=$days; $i++){
					echo '<option value="'.$i.'"> '.$i.'</option>';
					}
					?>
				</select>
				<input type="submit" name="submit" value="submit"></input>
		</form></br>
		<div>
			<?php
			echo '<img src="'.$image.'"> </br> </br>';

			echo $horoscope;

			$clause=array(" Where you're going,",
			" If you feel under the weather,",
			" Considering the recent events in Istanbul,",
			" If you want my opinion,",
			" After purchasing a new yurt,",
			" Remember,",
			" Before beginning your next table-top game,");

		$noun=array(" you might wish",
			" you will have",
			" you may want",
			" you will need",
			" you must start",
			" you should begin",
			" you will be able");

		$predicate=array(" to build a fire",
			" to kick the side of your bathtub",
			" to throw lunch meat at a bird",
			" to perform an authentic, culturally-relevant rain dance",
			" to lick a moldy towel",
			" to build a nest out of your old socks",
			" to invest in a pair of really nice, wool longjohns");

		$detail=array(" because everyone knows the Krampus is real.",
			" because we're all mad here. Clean cup! Move down!",
			" because you're lucky; he's lucky; I'm lucky; we're all lucky!",
			" because I am the gatekeeper; are you the key master?",
			" because 1.21 gigawatts is a lot of power in 2015.",
			" because we did it! We did it! Lo hicimos!",
			" because, you're a wizard, Harry!");

		shuffle($clause);
			echo $clause[0];
		shuffle($noun);
			echo $noun[0];
		shuffle($predicate);
			echo $predicate[0];
		shuffle($detail);
			echo $detail[0];
			?>
		</div>
	</body>
	</html>

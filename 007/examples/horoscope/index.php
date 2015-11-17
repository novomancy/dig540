<?php
require_once('Sign.php');

$zodiac = array();

//create signs
array_push($zodiac, new Sign('Aries', 'Mar 21', 'Apr 19', 'Aries Horoscope Text.'));
array_push($zodiac, new Sign('Taurus', 'Apr 20', 'May 20', 'Taurus Horoscope Text.'));
array_push($zodiac, new Sign('Gemini', 'May 21', 'Jun 20', 'Gemini Horoscope Text.'));
array_push($zodiac, new Sign('Cancer', 'Jun 21', 'Jul 22', 'Cancer Horoscope Text.'));
array_push($zodiac, new Sign('Leo', 'Jul 23', 'Aug 22', 'Leo Horoscope Text.'));
array_push($zodiac, new Sign('Virgo', 'Aug 23', 'Sep 22', 'Virgo Horoscope Text.'));
array_push($zodiac, new Sign('Libra', 'Sep 23', 'Oct 22', 'Libra Horoscope Text.'));
array_push($zodiac, new Sign('Scorpio', 'Oct 23', 'Nov 21', 'Scorpio Horoscope Text.'));
array_push($zodiac, new Sign('Sagittarius', 'Nov 22', 'Dec 21', 'Sagittarius Horoscope Text.'));
array_push($zodiac, new Sign('Capricorn', 'Dec 23', 'Jan 19', 'Capricorn Horoscope Text.'));
array_push($zodiac, new Sign('Aquarius', 'Jan 20', 'Feb 18', 'Aquarius Horoscope Text.'));
array_push($zodiac, new Sign('Pisces', 'Feb 19', 'Mar 20', 'Pisces Horoscope Text.'));

//Set up form

$months = array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
$days = 31;

//Handle form if it has been submitted

$horoscope = "Choose a birthday to see your horoscope!";

//This will replace the line above with the appropriate horoscope text if the date falls within the range for that sign.
if(isset($_POST['submit'])){
  $target = $_POST['month'].' '.$_POST['day'];
  for($i=0; $i<count($zodiac); $i++){
    if($zodiac[$i]->is_in_range($target)){
      $horoscope = $zodiac[$i]->get_horoscope();
    }
  }
}

?>

<html>
  <head>
    <title>Horoscope demo</title>
  </head>
  <body>
    <form action="" method="post">
      <div>What's your birthday?</div>
      <select name="month">
<?php
  for($i=0; $i<count($months); $i++){
    echo '<option value="'.$months[$i].'"> '.$months[$i].'</option>';
  }
?>
      </select>
      <select name="day">
<?php
  for($i=1; $i<=$days; $i++){
    echo '<option value="'.$i.'"> '.$i.'</option>';
  }
?>
      </select>
      <input type="submit" name="submit" value="submit"></input>
    </form>
    <div>
      <?php echo $horoscope; ?>
    </div>
  </body>
</html>

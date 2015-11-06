<?php
class Sign{

  private $start=0;
  private $end=0;
  private $name='';
  private $horoscope='';

  public function __construct($_name, $_start, $_end, $_text){
    $this->start = date("z", strtotime($_start));
    $this->end = date("z", strtotime($_end));
    $this->name = $_name;
    $this->horoscope = $_text;
  }

  public function is_in_range($date){
    $date_num = date("z", strtotime($date));
    if($date_num >= $this->start && $date_num <= $this->end) return true;
    else return false;
  }

  public function get_horoscope(){
    return $this->horoscope;
  }
}
?>

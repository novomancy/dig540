<?php
class StarSign{

	private $start=0;
	private $end=0;
	private $name='';
	private $horoscope='';
	private $image='';

public function __construct($_image, $_name, $_start, $_end, $_horoscope){
		$this->name = $_name;
		$this->horoscope = $_horoscope;
		$this->start = date("z", strtotime($_start));
		$this->end = date("z", strtotime($_end));
		$this->image = $_image;
	}


	public function is_in_range($inDate){
		$date_num = $inDate;
		if(($date_num >= $this->start) && ($date_num <= $this->end)){
			return true;
		}else{
			return false;
		}
}
	public function get_horoscope(){

		return $this->horoscope;
		}

	public function get_image() {
		return $this->image;
	}

	}
?>

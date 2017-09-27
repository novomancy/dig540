<?php
/* This is the Controller; it receives requests and contains the application logic. */

class Controller{
	private $model;
	public $text;
	public $htmlStr;
		
/* This function readies the Model to provide data. */		
	public function __construct( Model $model ){
		$this->text = 'In the controller';
		$this->model = $model;
	}

	public function rollDie( $dieRoll ){
		$count = 0;
		$allRolls = 0;
		$value = 0;

		while ($count < $dieRoll):
			$value = $this->model->dieRoll( );
			$allRolls += $value;
			$this->htmlStr.='<br /> You rolled: '.$value;
			$count++;
		endwhile;

		$this->htmlStr.='<br /> <br /> Total: '.$allRolls;

		return $allRolls;
	}
}

?>
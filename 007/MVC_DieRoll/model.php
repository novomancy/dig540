<?php
/* This is the Model; it contains the data. If I were to call a database, this is where that call would belong. */

class Model{
	public $text;
	public function __construct( ){
		$this-> text = 'In the model';
	}

	public function dieRoll( ){
		$rollVal = rand(1,6);

		return $rollVal;
	}

}


?>

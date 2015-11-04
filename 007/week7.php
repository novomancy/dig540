<html>

	<head>
		<title>Sawtelle Week 7 Assignment</title>
	</head>

	<body>

<?php

	class nameGenerator{
		private $firstName;
		private $lastName;

		public function setName($userName){
		//error checking takes place here
		$this->name = $userName;
		}


		public function getName(){
		echo $this->name;
		}
	}
?>

	</body>
</html>

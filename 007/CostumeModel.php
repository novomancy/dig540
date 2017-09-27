<?php
class Costume{
  private $costume;

  public function setCostume($Costume){
    //error checking happens here
    $this->costume = $Costume;
  }
  public function getCostume(){
    echo $this->costume;
  }
}
class Name{
  private $name;
  
  public function setName($Name){
    //error checking happens here
    $this->name = $Name;
  }
  public function getName(){
    echo $this->name;
  }

}

?>

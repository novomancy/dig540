<?php
    class Voices{
      private $rank;
      private $title;
      private $year;
      private $permission;
      private $subject;
      private $contributor;
      private $genre;

      public function setRank($rankNumber){$this->rank = $rankNumber;}
      public function getRank(){print_r('Rank: '.$this->rank .'<br>');}
      public function setTitle($titleName){$this->title = $titleName;}
      public function getTitle(){print_r('Title: '.$this->title .'<br>');}               
      public function setYear($recordingYear){$this->year = $recordingYear;}
      public function getYear(){print_r('Year: '.$this->year .'<br>');}
      public function setPermission($permission){$this->permission = $permission;}
      public function getPermission(){print_r('Permission: '.$this->permission .'<br>');}
      public function setSubject($subjectName){$this->subject = $subjectName;}
      public function getSubject(){print_r('Subject: '.$this->subject .'<br>');}
      public function setGenre($genre){$this->genre = str_getcsv($genre);}
      public function getGenre(){
          for($j=0; $j<count($this->genre); $j++){
              if($j%2==0) print_r("<span style='color:blue'>genre #".($j+1)." is ".$this->genre[$j]."</span><br>");
              else print_r("<span style='color:red'>genre #". ($j+1)." is ".$this->genre[$j]."</span><br>");
          }
          
      }
      public function setContributor($contributor){$this->contributor = str_getcsv($contributor);}

      public function getContributor(){
          for($j=0; $j<count($this->contributor); $j++){
              if($j%2==0) print_r("<span style='color:blue'>Contributor #".($j+1)." is ".$this->contributor[$j]."</span><br>");
              else print_r("<span style='color:red'>Contributor #". ($j+1)." is ".$this->contributor[$j]."</span><br>");

          }
      }
      public function setData($data_row){
          $this->setRank($data_row [0]);
          $this->setTitle($data_row[1]);
          $this->setYear($data_row[3]);
          $this->setPermission($data_row[4]);
          $this->setSubject($data_row[5]);
          $this->setGenre($data_row[6]);
          $this->setContributor($data_row[2]);
      }
      public function getData(){
          $this->getRank();
          $this->getTitle();
          $this->getYear();
          $this->getPermission();
          $this->getSubject();
          $this->getGenre();
          $this->getContributor();
      }
      
  }

  ?>
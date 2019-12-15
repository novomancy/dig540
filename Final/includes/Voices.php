<?php
    class Voices{
      private $rank;
      private $title;
      private $year;
      private $permission;
      private $subject;
      private $contributor;
      private $genre; 
      private $id;

      public function setID ($dbID){$this->id=$dbID;}
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
      public function save (){
           global $pdo;
           
           try{
               $voices_insert = $pdo->prepare("INSERT INTO recording (number, title, year, permission, subject)
                                                VALUES (?, ?, ?, ?, ?,)");
               $db_voices = $voices_insert->execute([$this->rank, $this->title, $this->year, $this->permission, $this->subject, implode(',', $this->contributor)]); 
               $this->id = $pdo->lastInsertId();
               print_r("--Saved $this->title to the database.--<br>\n");   
               
               $select_genre = $pdo->prepare("SELECT * FROM genre WHERE name = ?");
               $genre_insert = $pdo->prepare("INSERT INTO genre (name) VALUES (?)");
               $genre_link = $pdo->prepare("INSERT INTO recording_genre (recording_id, genre_id) VALUES (?, ?)");

               for($i=0; $i<count($this->genres); $i++){
                   $select_genre->execute([$this->genres[$i]]);
                   $existing_genre = $select_genre->fetch();
                   if(!$existing_genre){
                       $db_genre = $genre_insert->execute([$this->genres[$i]]);
                       $genre_id = $pdo->lastInsertID();
                   } else {
                       $genre_id = $existing_genre ['id'];
                   } 
                   $genre_link->execute([$this->id, $genre_id]);
                   print_r("Connected " .$this->genres[$i]." to$this->title<br>\n"); 

                   }
                   flush ();
                   ob_flush();
               } catch (PDOException $e){
                print_r("Error saving voices to database: ".$e->getMessage() . "<br>\n");
               
            
               
                exit;
            }

           


           
               
              
        }
        
    }
    


  
?>
<?php
class Recording{
    private $rank;
    private $title;
    private $year;
    private $permission;
    private $subject;
    private $contributor;
    private $genre; 
    private $id;

    public function setID($dbID){$this->id=$dbID;}
    public function setRank($rank){$this->rank = $rank;}
    public function getRank(){print_r('Rank: '.$this->rank .'<br>');}
    public function setTitle($titleName){$this->title = $titleName;}
    public function getTitle(){print_r('Title: '.$this->title .'<br>');}               
    public function setYear($recordingYear){$this->year = $recordingYear;}
    public function getYear(){print_r('Year: '.$this->year .'<br>');}
    public function setPermission($permission){$this->permission = $permission;}
    public function getPermission(){print_r('Permission: '.$this->permission .'<br>');}
    public function setGenre($genre){ 
        $this->genre = str_getcsv($genre);
    }
    public function getGenre(){ 
        for($j=0; $j<count($this->genre); $j++){
            print_r('<a href="list_voices.php?genre='.$this->genre[$j].'">Genre #'.($j+1). ' is '.$this->genre[$j].'</a><br>');
            
        }
                    
    }
    public function setSubject($subject){ 
        $this->subject = str_getcsv($subject);
    }
    public function getSubject(){ 
        for($j=0; $j<count($this->subject); $j++){
            print_r("Subject #".($j+1)." is ".$this->subject[$j]."<br>");
        }
    }
    public function setContributor($contributor){
        $this->contributor = str_getcsv($contributor);
    }
    public function getContributor(){
        for($j=0; $j<count($this->contributor); $j++){
            print_r("Contributor #".($j+1)." is ".$this->contributor[$j]."<br>");
            
        }
            
    }
    
    public function getTitleLink(){    
        $anchor = '<a href="show_voice.php?id='.$this->id.'">'.$this->title.'</a>';    
        print_r($this->rank . ': '. $anchor . ' by ' . $this->contributor . '<br>');
    }

    //->setData runs all the setX methods
    //$data_row is a single row of data from the csv passed as an array. Mappings are below.
    public function setData($data_row){
        // mapping of data_row:    artist=3
        //                         title=2
        //                         rank=0
        //                         year=1
        //                         genre=4
        //                         subgenre=5
        $this->setPermission($data_row[3]);
        $this->setTitle($data_row[1]);
        $this->setRank($data_row[0]);
        $this->setYear($data_row[2]);
        $this->setGenre($data_row[5]);
        $this->setSubject($data_row[4]);
        $this->setContributor($data_row[6]);
    }

    //->getData runs all the getX methods (which print out the data for each property)
    public function getData(){
        $this->getPermission();
        $this->getTitle();
        $this->getRank();
        $this->getYear();
        $this->getGenre();
        $this->getSubject();
        $this->getContributor();
    }

    public function save(){

        global $pdo;

        try{
            $recording_insert = $pdo->prepare("INSERT INTO recording (rank, title, year, permission, subject, contributor)
                                            VALUES (?, ?, ?, ?, ?, ?)");
            $db_recording = $recording_insert->execute([$this->rank, $this->title, $this->year, $this->permission, implode(',', $this->subject), implode(',', $this->contributor)]);
            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->title to the database.--<br>\n");

            $select_genre = $pdo->prepare("SELECT * FROM genre WHERE name = ?");
            $genre_insert = $pdo->prepare("INSERT INTO genre (name) VALUES (?)");
            $genre_link = $pdo->prepare("INSERT INTO recording_genre (recording_id, genre_id) VALUES (?, ?)");

            for($i=0; $i<count($this->genre); $i++){
                $select_genre->execute([$this->genre[$i]]);
                $existing_genre = $select_genre->fetch();
                if(!$existing_genre){
                    $db_genre = $genre_insert->execute([$this->genre[$i]]);
                    $genre_id = $pdo->lastInsertID();
                } else {
                    $genre_id = $existing_genre['id'];
                }
                $genre_link->execute([$this->id, $genre_id]);
                print_r("Connected ".$this->genre[$i]." to $this->title<br>\n");
            }

            
            
          flush();
          ob_flush();
            
        } catch (PDOException $e){
            print_r("Error saving recording to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load_by_id($id){
       global $pdo;

       

        try{
            $find_voice = $pdo->prepare("SELECT * FROM recording 
                                            WHERE id = ?");
            $select_genre = $pdo->prepare("SELECT genre.name AS name
                                             FROM recording_genre, genre
                                            WHERE recording_genre.recording_id = ?
                                              AND recording_genre.genre_id = genre.id");

            $find_voice->execute([$id]);

            $db_voice = $find_voice->fetch();
            if(!$db_voice){
                return false;

            } else {
                $recording = new Recording();
                $recording->setTitle($db_voice['title']);
                $recording->setYear($db_voice['year']);
                $recording->setRank($db_voice['rank']);
                $recording->setPermission($db_voice['permission']);
                $recording->setSubject($db_voice['subject']);
                $recording->setContributor($db_voice['contributor']);
                $recording->setID($db_voice['id']);

                $select_genre->execute([$id]);
                $db_genre = $select_genre->fetchAll();
                $genre = array();
                for($j=0; $j<count($db_genre); $j++){
                     array_push($genre, $db_genre[$j]['name']);
                }
                $recording->setGenre(implode(',', $genre));
                return $recording;




            }
                  

                
                
        } catch (PDOException $e){
            print_r("Error reading single recording from database: ".$e->getMessage() . "<br>\n");
        } exit;                     



            



        
        
    
    }    

    static public function load($genre=false){
        global $pdo;
        $voices = array();

        try{
            if($genre==false){
                $select_voices = $pdo->prepare("SELECT * FROM recording ORDER BY rank ASC");
                $select_voices->execute();
            } else {
                $select_voices = $pdo->prepare("SELECT recording.* FROM recording, recording_genre, genre
                                                 WHERE recording.id = recording_genre.recording_id AND
                                                  recording_genre.genre_id = genre.id AND
                                                  genre.name = ?
                                                  ORDER BY recording.rank ASC");
                $select_voices->execute([$genre]);

            }    
                 


            
            
            $select_genre = $pdo->prepare("SELECT genre.name AS name
                                             FROM recording_genre, genre
                                            WHERE recording_genre.recording_id = ?
                                              AND recording_genre.genre_id = genre.id");
            
            $db_voices = $select_voices->fetchAll();

            for ($i=0; $i<count($db_voices); $i++){
                $recording = new Recording();
                $recording->setTitle($db_voices[$i]['title']);
                $recording->setYear($db_voices[$i]['year']);
                $recording->setRank($db_voices[$i]['rank']);
                $recording->setPermission($db_voices[$i]['permission']);
                $recording->setSubject($db_voices[$i]['subject']);
                $recording->setContributor($db_voices[$i]['contributor']);
                $recording->setID($db_voices[$i]['id']);

                $select_genre->execute([$recording->id]);
                $db_genre = $select_genre->fetchAll();
                $genre = array();
                for ($j=0; $j<count($db_genre); $j++){
                     array_push($genre, $db_genre[$j]['name']);
                }
                $recording->setGenre(implode(',', $genre));
                array_push($voices, $recording);


            }
            return $voices;          

            


        }catch (PDOException $e){
            print_r("Error reading recording from database: ".$e->getMessage() . "<br>\n");
        } exit;       

    
    
    }        

       


}   
?>    
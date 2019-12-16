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
            if($j%2==0) print_r("<span style='color:blue'>genre #".($j+1)." is ".$this->genre[$j]."</span><br>");
            else print_r("<span style='color:red'>genre #". ($j+1)." is ".$this->genre[$j]."</span><br>");
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
            if($j%2==0) print_r("<span style='color:blue'>Contributor #".($j+1)." is ".$this->contributor[$j]."</span><br>");
            else print_r("<span style='color:red'>Contributor #". ($j+1)." is ".$this->contributor[$j]."</span><br>");
        }
            
    }
    
    public function getTitleLink(){
        $anchor = '<a href="show_recording.php?id='.$this->id.'">'.$this->title.'</a>';
        print_r($this->rank . ': '. $anchor . ' by ' . $this->permission . '<br>');
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
            $recording_insert = $pdo->prepare("INSERT INTO recording (rank, title, year, permission, subject)
                                            VALUES (?, ?, ?, ?, ?)");
            $db_recording = $recording_insert->execute([$this->rank, $this->title, $this->year, $this->permission, implode(',', $this->subject)]);
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

            $select_contributor = $pdo->prepare("SELECT * FROM contributor WHERE name =?");
            $contributor_insert = $pdo->prepare("INSERT INTO contributor (name) VALUES (?)");
            $contributor_link = $pdo->prepare("INSERT INTO recording_contributor (recording_id, contributor_id) VALUES (?,?)");

            for($i=0; $i<count($this->contributor); $i++){
                $select_contributor->execute([$this->contributor[$i]]);
                $existing_contributor = $select_contributor->fetch();
                if(!$existing_contributor){
                    $db_contributor = $contributor_insert->execute([$this->contributor[$i]]);
                    $contributor_id = $pdo->lastInsertID();
                } else {
                    $contributor_id = $existing_contributor['id'];
                } 
                $contributor_link->execute([$this->id, $contributor_id]);
                print_r("Connected ".$this->contributor[$i]." to $this->title<br>\n");   
                
                

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
            $find_recording = $pdo->prepare("SELECT * FROM recording
                                            WHERE id = ?");
            $select_genre = $pdo->prepare("SELECT genre.name AS name
                                                FROM recording_genre, genre
                                                WHERE recording_genre.album_id = ?
                                                AND recording_genre.genre_id = genre.id");
            $find_recording->execute([$id]);
            $db_recording = $find_recording->fetch();
            if(!$db_recording){
                return false;
            } else {
                $recording = new Recording();
                $recording->setTitle($db_recording['title']);
                $recording->setYear($db_recording['year']);
                $recording->setRank($db_recording['rank']);
                $recording->setPermission($db_recording['permission']);
                $recording->setSubject($db_subject['subject']);
                $recording->setID($id);

                $select_genre->execute([$id]);
                $db_genre = $select_genre->fetchAll();
                $genre = array();
                for($j=0; $j<count($db_genre); $j++){
                    array_push($genre, $db_genre[$j]['name']);
                }
                $genre->setGenre(implode(',', $genre));
                return $recording;                
            }
        } catch (PDOException $e){
            print_r("Error reading single recording from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load($genre=false){
        global $pdo;

        $recordings = array();
        try{
            if($genre==false){
                $select_genre = $pdo->prepare("SELECT * FROM recording ORDER BY number ASC");
                $select_recording->execute();
            } else {
                $select_recordings = $pdo->prepare("SELECT recording.* FROM recording, recording_genre, genre
                                                WHERE recording.id = recording_genre.recording_id AND
                                                  recording_genre.genre_id = genre.id AND
                                                  genre.name = ?
                                                ORDER BY recording.number ASC");
                $select_recordings->execute([$genre]);
            }
            
            $select_genre = $pdo->prepare("SELECT genre.name AS name
                                            FROM recording_genre, genre
                                            WHERE recording_genre.album_id = ?
                                              AND recording_genre.genre_id = genre.id");


            $db_recording = $select_recording->fetchAll();

            for($i=0; $i<count($db_recording); $i++){
                $recording = new recording();
                $recording ->setTitle($db_recordings[$i]['title']);
                $recording->setYear($db_recordings[$i]['year']);
                $recording->setRank($db_recordings[$i]['rank']);
                $recording->setPermission($db_recordings[$i]['permission']);
                $recording->setSubject($db_recordings[$i]['subject']);
                $recording->setID($db_recordings[$i]['id']);

                $select_genre->execute([$recording->id]);
                $db_genre = $select_genre->fetchAll();
                $genre = array();
                for($j=0; $j<count($db_genre); $j++){
                    array_push($genre, $db_genre[$j]['name']);
                }
                $album->setGenre(implode(',', $genre));
                array_push($recordings, $recording);

                $select_contributor->execute([$recording->id]);
                $db_genre = $select_contributor->fetchAll();
                $contributor = array();
                for($j=0; $j<count($db_contributor); $j++){
                    array_push($contributor, $db_contributor[$j]['name']);
                }
                $album->setContributor(implode(',', $contributor));
                array_push($recordings, $recording);
            }
            return $recordings;
        } catch (PDOException $e){
            print_r("Error reading recording from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }
}
?>

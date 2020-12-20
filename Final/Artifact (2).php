<?php
class Artifact{
    private $name;
    private $description;
    private $rank;
    private $date;
    private $material;
    private $tribe;
    private $location;
    private $image;
    private $id;

    public function setID($dbID){ $this->id = $dbID; }
    public function setName($name){ $this->name = $name; }
    public function getName(){ print_r( 'Name: '.$this->name . '<br>'); }
    public function setImage($image){ $this->image = $image; }
    public function getImage(){ print_r( 'Image: '.$this->image . '<br>'); }
    public function setDescription($descriptionName){ $this->description = $descriptionName; }
    public function getDescription(){ print_r('Descrption: '.$this->description . '<br>'); }
    public function setRank($rankNumber){ $this->rank = $rankNumber; }
    public function getRank(){ print_r('Rank: '.$this->rank . '<br>'); }
    public function setDate($date){ $this->date = $date; }
    public function getDate(){ print_r('Date: '.$this->date . '<br>'); }
    public function setLocation($locationname){ $this->location = $locationname; }
    public function getLocation(){ print_r( 'Location: '.$this->location . '<br>'); }
    public function setMaterial($material){ 
        $this->material = str_getcsv($material);
    }
    public function getMaterial(){ 
        for($j=0; $j<count($this->material); $j++){
            print_r('<a href="list_artifacts.php?material='.$this->material[$j].'">Material is '.$this->material[$j].'</a><br>');
        }
    }
    public function setTribe($tribe){ 
        $this->tribe = str_getcsv($tribe);
    }

    public function getTribe(){ 
        for($j=0; $j<count($this->tribe); $j++){
            print_r("Tribe is ".$this->tribe[$j]."<br>");
        }
    }
    public function getNameLink(){
        $anchor = '<a href="show_artifact.php?id='.$this->id.'">'.$this->name.'</a>';
        print_r($this->rank . ': '. $anchor . ' by ' . $this->name . '<br>');
    }

    public function setData($data_row){
       
        $this->setRank($data_row[0]);
        $this->setName($data_row[1]);
        $this->setDate($data_row[4]);
        $this->setLocation($data_row[5]);
        $this->setTribe($data_row[6]);
        $this->setMaterial($data_row[3]);
        $this->setDescription($data_row[2]);
        $this->setImage($data_row[7]);

    }

    public function getData(){
        $this->getRank();
        $this->getName();
        $this->getDate();
        $this->getLocation();
        $this->getTribe(); 
        $this->getImage();
        $this->getMaterial();
    }

    public function save(){
        global $pdo;

        try{
            $artifact_insert = $pdo->prepare("INSERT INTO artifact (rank, name, location, date,image)
                                            VALUES (?, ?, ?, ?, ?,?)");
            $db_artifact = $artifact_insert->execute([$this->rank, $this->name, $this->location, $this->date, $this->description, $this->image]);
            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->name to the database.--<br>\n");

            $select_material = $pdo->prepare("SELECT * FROM material WHERE name = ?");
            $material_insert = $pdo->prepare("INSERT INTO material (name) VALUES (?)");
            $atifact_material = $pdo->prepare("INSERT INTO artifact_material (artifact_id, material_id) VALUES (?, ?)");

            for($i=0; $i<count($this->material); $i++){
                $select_material->execute([$this->material[$i]]);
                $existing_material = $select_material->fetch();
                if(!$existing_material){
                    $db_material = $material_insert->execute([$this->material[$i]]);
                    $material_id = $pdo->lastInsertID();
                } else {
                    $material_id = $existing_material['id'];
                }
           
            }
            $select_tribe = $pdo->prepare("SELECT * FROM tribe WHERE name = ?");
            $tribe_insert = $pdo->prepare("INSERT INTO tribe (name) VALUES (?)");
            $atifact_tribe = $pdo->prepare("INSERT INTO artifact_tribe (artifact_id, tribe_id) VALUES (?, ?)");

            for($i=0; $i<count($this->tribe); $i++){
                $select_tribe->execute([$this->tribe[$i]]);
                $existing_tribe = $select_tribe->fetch();
                if(!$existing_tribe){
                    $db_tribe = $tribe_insert->execute([$this->tribe[$i]]);
                    $tribe_id = $pdo->lastInsertID();
                } else {
                    $tribe_id = $existing_tribe['id'];
                }
             
            }
            flush();
        } catch (PDOException $e){
            print_r("Error saving artifact to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load_by_id($id){
        global $pdo;

        try{
            $find_artifact = $pdo->prepare("SELECT * FROM artifact
                                            WHERE id = ?");
            $select_material = $pdo->prepare("SELECT material.name AS name
                                                FROM artifact_material, material
                                                WHERE artifact_material.artifact_id = ?
                                                AND artifact_material.material_id = material.id");
             $select_tribe = $pdo->prepare("SELECT tribe.name AS name
                                                FROM artifact_tribe, tribe
                                                WHERE artifact_tribe.artifact_id = ?
                                                AND artifact_tribe.tribe_id = tribe.id");                                    
            $find_artifact->execute([$id]);
            $db_artifact = $find_artifact->fetch();
            if(!$db_artifact){
                return false;
            } else {
                $artifact = new Artifact();
                $artifact->setName($db_artifact['name']);
                $artifact->setImage($db_artifact['image']);
                $artifact->setDate($db_artifact['date']);
                $artifact->setRank($db_artifact['number']);
                $artifact->setDescription($db_artifact['description']);
                $artifact->setTribe($db_artifact['tribe']);
                $artifact->setMaterial($db_artifact['material']);
                $artifact->setID($id);

                $select_material->execute([$id]);
                $db_materials = $select_material->fetchAll();
                $materials = array();
                for($j=0; $j<count($db_materials); $j++){
                    array_push($materials, $db_materials[$j]['name']);
                }
                $select_tribe->execute([$id]);
                $db_tribe = $select_tribe->fetchAll();
                $tribe = array();
                for($j=0; $j<count($db_tribe); $j++){
                    array_push($tribe, $db_tribe[$j]['name']);
                }     
                array_push($artifacts, $artifact);     
            }
        } catch (PDOException $e){
            print_r("Error reading single artifact from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load($material=false){
        global $pdo;

        $artifacts = array();
        try{
            if($material==false){
                $select_artifact = $pdo->prepare("SELECT * FROM artifact ORDER BY number ASC");
                $select_artifact->execute();
            } else {
                $select_artifact = $pdo->prepare("SELECT artifact.* FROM artifact, artifact_material, material
                                                WHERE artifact.id = artifact_material.artifact_id AND
                                                  artifact_material.material_id = material.id AND
                                                  material.name = ?
                                                ORDER BY artifact.number ASC");
                $select_artifact->execute([$material]);
            }
            
            $select_material = $pdo->prepare("SELECT material.name AS name
                                            FROM artifact_material, material
                                            WHERE artifact_material.artifact_id = ?
                                              AND artifact_material.material_id = material.id");


            $db_artifact = $select_artifacts->fetchAll();

            for($i=0; $i<count($db_artifacts); $i++){
                $artifact = new Artifact();
                $artifact->setName($db_artifact[$i]['name']);
                $artifact->setImage($db_artifact['image']);
                $artifact->setDate($db_artifact[$i]['date']);
                $artifact->setRank($db_artifact[$i]['number']);
                $artifact->setTribe($db_artifact[$i]['tribe']);
                $artifact->setDescription($db_artifact[$i]['description']);
                $artifact->setID($db_artifact[$i]['id']);

                $select_material->execute([$artifact->id]);
                $db_material = $select_material->fetchAll();
                $material = array();
                for($j=0; $j<count($db_material); $j++){
                    array_push($material, $db_material[$j]['name']);
                }
                array_push($artifacts, $artifact);
            }
            return $artifacts;
        } catch (PDOException $e){
            print_r("Error reading artifact from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }
}
?>
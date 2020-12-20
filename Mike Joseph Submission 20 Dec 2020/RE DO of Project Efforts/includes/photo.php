<?php
class Photo{
	    private $photographer_first_name;
        private $photographer_last_name;
        private $Photographer_city;
        private $photographer_state;
        private $photographer_zip_code;
        private $exhibit_title;
        private $exhibit_subject;
        private $exhibit_theme;
        private $photo_title;
        private $photo_subject;
        private $date;
        private $hour;
        private $pixel_x_dimension;
        private $pixel_y_dimension;
        private $horizontal_resolution;
        private $vertical_resolution;
        private $bit_depth;
        private $resolution_unit;
        private $color_representation;
        private $compression;
        private $photo_item_type;
        private $photo_url;
        private $id;
	
	    public function setID($dbID){ $this->id = $dbID; }

	      
        public function setphotographer_First_Name($photographer_first_Name)
        { 
	        $this->first_name = $photographer_first_Name; 
	    }
	    
		        
        public function getPhotographer_First_Name(){ 
	        print_r( 'Photographer: '.$this->first_name . '  '); 
        }
	     
	    public function setPhotographer_last_Name($photographer_last_Name) {
		    $this->last_name = $photographer_last_Name;
	    }   
	        
	        
	    public function getPhotographer_last_Name(){
		    print_r( ' '.$this->last_name . '<br>'); 
	        }
        public function setCity($cityName){ 
	        $this->city = $cityName; 
	        }
        public function getCity(){ 
	        print_r('City: '.$this->city . '<br>'); 
	        }
        public function setState($stateNameCode){ 
	        $this->state = $stateNameCode; 
	        }
        public function getState(){ 
	        print_r('State: '.$this->state . '<br>'); 
	        }
        public function setZipCode($zip_codeNumber){
	         $this->zip_code = $zip_codeNumber; 
	        }
        public function getZipCode(){ 
	         print_r('Zip Code: '.$this->zip_code . '<br>'); 
	        }
	        
	    public function setExhibitTitle($exhibitTitleName){ 
	        $this->exhibit_title = $exhibitTitleName; 
	        }
        public function getExhibitTitle(){ 
	        print_r('Exhibit Title: '.$this->exhibit_title . '<br>'); 
	        }
        public function setExhibitSubject($exhibitSubjectName){
	         $this->exhibit_subject = $exhibitSubjectName; 
	        }
        public function getExhibitSubject(){ 
	         print_r('Exhibit Subject: '.$this->exhibit_subject . '<br>'); 
	        }
	        
        public function setExhibitTheme($exhibitThemeName){ 
	        $this->exhibit_theme = $exhibitThemeName; 
	        }
        public function getExhibitTheme(){ 
	        print_r('Exhibit Theme: '.$this->exhibit_theme . '<br>'); 
	        }
        public function setImageTitle($imageTitleName){ 
	        $this->image_title = $imageTitleName; 
	        }
        public function getImageTitle(){ 
	        print_r('Image Title: '.$this->image_title . '<br>'); 
	        }
        public function setImageSubject($image_SubjectName){
	         $this->image_subject = $image_SubjectName; 
	        }
        public function getImageSubject(){ 
	         print_r('Image Subject: '.$this->image_subject . '<br>'); 
	        }
	        
	       public function setImageDate($image_dateNumber){ 
	        $this->image_date = $image_dateNumber; 
	        }
        public function getImageDate(){ 
	        print_r('Date: '.$this->image_date . '<br>'); 
	        }
        public function setImageHour($image_HourName){ 
	        $this->image_hour = $image_HourName; 
	        }
        public function getImageHour(){ 
	        print_r('Hour: '.$this->image_hour . '<br>'); 
	        }
        public function setPixelXDimension($pixel_x_dimensionNumber){
	         $this->pixel_x_dimension = $pixel_x_dimensionNumber; 
	        }
        public function getPixelXDimension(){ 
	         print_r('Pixel_X_Dimension: '.$this->pixel_x_dimension . '<br>'); 
	        }
	        
	     public function setPixelYDimension($pixel_y_dimensionNumber){
	         $this->pixel_y_dimension = $pixel_y_dimensionNumber; 
	        }
        public function getPixelYDimension(){ 
	         print_r('Pixel_Y_Dimension: '.$this->pixel_y_dimension . '<br>'); 
	        }   
        
	    public function setHorizontalResolution($horizontal_resolutionName){ 
	        $this->horizontal_resolution = $horizontal_resolutionName; 
	        }
        public function getHorizontalResolution(){ 
	        print_r('Horizontal Resolution: '.$this->horizontal_resolution . '<br>'); 
	        }
	        
	     public function setVerticalResolution($vertical_resolutionName){ 
	        $this->vertical_resolution = $vertical_resolutionName; 
	        }
        public function getVerticalResolution(){ 
	        print_r('Vertical Resolution: '.$this->vertical_resolution . '<br>'); 
	        }   
	        
        public function setBitDepth($bit_depthNumber){
	         $this->bit_depth = $bit_depthNumber; 
	        }
        public function getBitDepth(){ 
	         print_r('Bit Depth: '.$this->bit_depth . '<br>'); 
	        } 
	    
	        
	    public function setImageResolutionUnit($image_resolution_unitNumber){
	         $this->image_resolution_unit = $image_resolution_unitNumber; 
	        }
        public function getImageResolutionUnit(){ 
	         print_r('Image Resolution Unit: '.$this->image_resolution_unit . '<br>'); 
	        }  
	        
	    public function setColorRepresentation($color_representationName){
	         $this->color_representation = $color_representationName; 
	        }
        public function getColorRepresentation(){ 
	         print_r('Color Representation: '.$this->color_representation . '<br>'); 
	        }    
	      
	    public function setCompression($compressionName){
	         $this->compression = $compressionName; 
	        }
        public function getCompression(){ 
	         print_r('Compression: '.$this->compression . '<br>'); 
	        }    
	            
        public function setImageItemType($image_item_typeName){
	         $this->image_item_type = $image_item_typeName; 
	        }
        public function getImageItemType(){ 
	         print_r('Image Item Type: '.$this->image_item_type . '<br>'); 
	        }  
	        
	    public function setImageURL($image_urlName){
	         $this->image_url = $image_urlName; 
	        }
        public function getImageURL(){ 
	        
	         $image = file_get_contents("$image_urlName");
             print_r ($image);
        }
	         
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
    public function setID($dbID){ $this->id = $dbID; }
    
    
    
    
    
    
    
    
    
    
    
    
    public function setExhibits($exhibits){ 
        $this->exhibits = str_getcsv($exhibits);
    }
    public function getExhibits(){ 
        for($j=0; $j<count($this->exhibits); $j++){
            print_r('<a href="list_photos.php?exhibit='.$this->exhibits[$j].'">Genre #'.($j+1).' is '.$this->exhibits[$j].'</a><br>');
        }
    }
    public function setSubexhibits($subs){ 
        $this->subexhibits = str_getcsv($subs);
    }
    public function getSubexhibits(){ 
        for($j=0; $j<count($this->subexhibits); $j++){
            print_r("Subexhibit #".($j+1)." is ".$this->subexhibits[$j]."<br>");
        }
    }
    public function getTitleLink(){
        $anchor = '<a href="show_photo.php?id='.$this->id.'">'.$this->title.'</a>';
        print_r($this->rank . ': '. $anchor . ' by ' . $this->artist . '<br>');
    }

    //->setData runs all the setX methods
    //$data_row is a single row of data from the csv passed as an array. Mappings are below.
    public function setData($data_row){
        // mapping of data_row:    artist=3
        //                         title=2
        //                         rank=0
        //                         year=1
        //                         exhibit=4
        //                         subexhibit=5
        $this->setArtist($data_row[3]);
        $this->setTitle($data_row[2]);
        $this->setRank($data_row[0]);
        $this->setYear($data_row[1]);
        $this->setGenres($data_row[4]);
        $this->setSubexhibits($data_row[5]);
    }

    //->getData runs all the getX methods (which print out the data for each property)
    public function getData(){
        $this->getTitle();
        $this->getYear();
        $this->getRank();
        $this->getArtist();
        $this->getGenres();
        $this->getSubexhibits();
    }

    public function save(){
        global $pdo;

        try{
            $photo_insert = $pdo->prepare("INSERT INTO photo (number, year, title, artist, subexhibit)
                                            VALUES (?, ?, ?, ?, ?)");
            $db_photo = $photo_insert->execute([$this->rank, $this->year, $this->title, $this->artist, implode(',', $this->subexhibits)]);
            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->title to the database.--<br>\n");

            $select_exhibit = $pdo->prepare("SELECT * FROM exhibit WHERE name = ?");
            $exhibit_insert = $pdo->prepare("INSERT INTO exhibit (name) VALUES (?)");
            $exhibit_link = $pdo->prepare("INSERT INTO photo_exhibit (photo_id, exhibit_id) VALUES (?, ?)");

            for($i=0; $i<count($this->exhibits); $i++){
                $select_exhibit->execute([$this->exhibits[$i]]);
                $existing_exhibit = $select_exhibit->fetch();
                if(!$existing_exhibit){
                    $db_exhibit = $exhibit_insert->execute([$this->exhibits[$i]]);
                    $exhibit_id = $pdo->lastInsertID();
                } else {
                    $exhibit_id = $existing_exhibit['id'];
                }
                $exhibit_link->execute([$this->id, $exhibit_id]);
                print_r("Connected ".$this->exhibits[$i]." to $this->title<br>\n");
            }
            flush();
            ob_flush();
        } catch (PDOException $e){
            print_r("Error saving photo to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load_by_id($id){
        global $pdo;

        try{
            $find_photo = $pdo->prepare("SELECT * FROM photo
                                            WHERE id = ?");
            $select_exhibit = $pdo->prepare("SELECT exhibit.name AS name
                                                FROM photo_exhibit, exhibit
                                                WHERE photo_exhibit.photo_id = ?
                                                AND photo_exhibit.exhibit_id = exhibit.id");
            $find_->execute([$id]);
            $db_photo = $find_photo->fetch();
            if(!$db_photo){
                return false;
            } else {
                $photo = new Photo();
                $photo->setTitle($db_photo['title']);
                $photo->setYear($db_photo['year']);
                $photo->setRank($db_photo['number']);
                $photo->setArtist($db_photo['artist']);
                $photo->setSubexhibits($db_photo['subexhibit']);
                $photo->setID($id);

                $select_exhibit->execute([$id]);
                $db_exhibits = $select_exhibit->fetchAll();
                $exhibits = array();
                for($j=0; $j<count($db_exhibits); $j++){
                    array_push($exhibits, $db_exhibits[$j]['name']);
                }
                $photo->setExhibits(implode(',', $exhibits));
                return $photo;                
            }
        } catch (PDOException $e){
            print_r("Error reading single photo from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }

    static public function load($exhibit=false){
        global $pdo;

        $photos = array();
        try{
            if($exhibit==false){
                $select_photos = $pdo->prepare("SELECT * FROM photo ORDER BY number ASC");
                $select_photos->execute();
            } else {
                $select_photos = $pdo->prepare("SELECT photo.* FROM photo, photo_exhibit, exhibit
                                                WHERE photo.id = photo_exhibit.photo_id AND
                                                  photo_exhibit.exhibit_id = exhibit.id AND
                                                  exhibit.name = ?
                                                ORDER BY photo.number ASC");
                $select_photos->execute([$exhibit]);
            }
            
            $select_exhibit = $pdo->prepare("SELECT exhibit.name AS name
                                            FROM photo_exhibit, exhibit
                                            WHERE photo_exhibit.photo_id = ?
                                              AND photo_exhibit.exhibit_id = exhibit.id");


            $db_photos = $select_photos->fetchAll();

            for($i=0; $i<count($db_photos); $i++){
                $photo = new Photo();
                $photo->setTitle($db_photos[$i]['title']);
                $photo->setYear($db_photos[$i]['year']);
                $photo->setRank($db_photos[$i]['number']);
                $photo->setArtist($db_photos[$i]['artist']);
                $photo->setSubexhibits($db_photos[$i]['subexhibit']);
                $photo->setID($db_photos[$i]['id']);

                $select_exhibit->execute([$photo->id]);
                $db_exhibits = $select_exhibit->fetchAll();
                $exhibits = array();
                for($j=0; $j<count($db_exhibits); $j++){
                    array_push($exhibits, $db_exhibits[$j]['name']);
                }
                $photo->setExhibits(implode(',', $exhibits));
                array_push($photos, $photo);
            }
            return $photos;
        } catch (PDOException $e){
            print_r("Error reading photo from database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    }
}
?>
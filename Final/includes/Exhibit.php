<?php
    
    class Exhibit{
        private $first_name;
        private $last_name;
        private $city;
        private $state;
        private $zip_code;
        private $exhibit_title;
        private $exhibit_subject;
        private $exhibit_theme;
        private $image_title;
        private $image_subject;
        private $image_date;
        private $image_hour;
        private $pixel_x_dimension;
        private $pixel_y_dimension;
        private $horizontal_resolution;
        private $vertical_resolution;
        private $bit_depth;
        private $image_resolution_unit;
        private $color_representation;
        private $compression;
        private $image_item_type;
        private $image_url;
        private $photographer_id;
        private $exhibit_id;
        private $image_id;
        
        public function setID($dbID){$this->image_id = $dbID;}   
       
        public function setphotographerFirst_Name($photographerfirst_Name)
        { 
	        $this->first_name = $photographerfirst_Name; 
	    }
	    
		        
        public function getPhotographerFirst_Name(){ 
	        print_r( 'Photographer: '.$this->first_name . '  '); 
        }
	     
	    public function setPhotographerLast_Name($photographerlast_Name) {
		    $this->last_name = $photographerlast_Name;
	    }   
	        
	        
	    public function getPhotographerLast_Name(){
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
	        
	   
            
        public function setData($data_row){
	        
           $this->setPhotographerFirst_Name($data_row[0]);
           $this->setPhotographerLast_Name($data_row[1]);
           $this->setCity($data_row[2]);
           $this->setState($data_row[3]);
           $this->setZipCode($data_row[4]);
           $this->setExhibitTitle($data_row[5]);
           $this->setExhibitSubject($data_row[6]);
           $this->setExhibitTheme($data_row[7]);
           $this->setImageTitle($data_row[8]);
           $this->setImageSubject($data_row[9]);
           $this->setImageDate($data_row[10]);
           $this->setImageHour($data_row[11]);
           $this->setPixelXDimension($data_row[12]);
           $this->setPixelYDimension($data_row[13]);
           $this->setHorizontalResolution($data_row[14]);
           $this->setVerticalResolution($data_row[15]);
           $this->setBitDepth($data_row[16]);
           $this->setImageResolutionUnit($data_row[17]);
	       $this->setColorRepresentation($data_row[18]);
           $this->setCompression($data_row[19]);
           $this->setImageItemType($data_row[20]);
           $this->setImageURL($data_row[21]);
        }

        public function getData(){
             
	       $this->getPhotographerFirst_Name();
           $this->getPhotographerLast_Name();
           $this->getCity();
           $this->getState();
           $this->getZipCode();
           $this->getExhibitTitle();
           $this->getExhibitSubject();
           $this->getExhibitTheme();
           $this->getImageTitle();
           $this->getImageSubject();
           $this->getImageDate();
           $this->getImageHour();
           $this->getPixelXDimension();
           $this->getPixelYDimension();
           $this->getHorizontalResolution();
           $this->getVerticalResolution();
           $this->getBitDepth();
           $this->getImageResolutionUnit();
	       $this->getColorRepresentation();
           $this->getCompression();
           $this->getImageItemType();
           $this->getImageURL();
	        
            
         }

   
          public function save(){
	      global $pdo;
	      try{  
		     	      
		      $photographer_insert=$pdo->prepare("INSERT INTO Photographer(first_name,last_name,city, state,zip_code)
	                          VALUES(?,?,?,?,?)");
	          $db_photographer=$photographer_insert->execute([$this->first_name,$this->last_name,$this->city,$this->state,$this->zip_code]);
              $this->photographer_id=$pdo->lastInsertId();
	          print_r ("---Saved $this->image_title to the database.---<br>/n"); 
	                          
	          $exhibit_insert=$pdo->prepare("INSERT INTO Exhibit(title,subject,theme)
	                          VALUES(?,?,?)");
	           $db_exhibit=$exhibit_insert->execute([$this->exhibit_title,$this->exhibit_subject,$this->exhibit_theme]);               
	           $this->exhibit_id=$pdo->lastInsertId();              
	                          
	                          
	          $image_insert=$pdo->prepare("INSERT INTO Image(title,subject,date,hour,pixel_x_dimension,pixel_y_dimension,horizontal_resolution,vertical_resolution,bit_depth,resolution_unit,color_representation,compression, image_item_type,image_url)
	                          VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	           $db_image=$image_insert->execute([$this->image_title,$this->image_subject,
	           $this->image_date,$this->image_hour,$this->pixel_x_dimension,$this->pixel_y_dimension,$this->horizontal_resolution,
	           $this->vertical_resolution,$this->bit_depth,$this->image_resolution_unit,$this->color_representation,
	           $this->compression,$this->image_item_type,$this->image_url]);
	           $this->image_id=$pdo->lastInsertId();
	          
	          $Image_Exhibit_insert = $pdo->prepare("INSERT INTO Image_Exhibit(image_id, exhibit_id) 
	                          VALUES (?, ?)");
              $db_Image_Exhibit_link=$Image_Exhibit_insert->execute([$this->image_id, $this->exhibit_id]);
	                           
	         
                   
	                         
              flush();
		  	  ob_flush();  
		  	               
      }  catch(PDOException $e){
            print_r("Error reading single image from database: ".$e->getMessage() . "<br>\n");
            exit;

	} 		 
					
      }	
			 
	     
    
	   
	   static public function load($title=false){
		   
		   global $pdo;
		   
		   $exhibits=array();
		   
		   try{
			   
			   if($title==false){
			   
			   
			   $select_exhibits = $pdo->prepare("SELECT*FROM Exhibit ORDER BY Exhibit.title ASC");
			   $select_images = $pdo->prepare ("SELECT Image.id,Image.title,Image.subject,Image.date,Image.hour,Image.pixel_x_dimension,Image.pixel_y_dimension,Image.horizontal_resolution,Image.vertical_resolution,Image.bit_depth,Image.resolution_unit,Image.color_representation,Image.compression,Image.image_item_type,Image.image_url, Image.photographer_id 
			                                    FROM Image_Exhibit, Image
			                                    WHERE Image_Exhibit.Exhibit_id = ?
			                                    AND   Image_Exhibit.Image_id = Image.id ORDER BY Image.title ASC");

			   $select_photographers = $pdo->prepare("SELECT Photographer.first_name, Photographer.last_name, Photographer.city, Photographer.state,Photographer.zip_code,Photographer.id 
			                                   FROM Photographer 
			                                   WHERE Photographer.id = Image.photographer_id");                                               
			
			  } else { $select_exhibits = $pdo->prepare("SELECT Exhibit.*, Image.*, Photographer.first_name, Photographer.last_name FROM Exhibit, Image, Photographer, Image_Exhibit WHERE (Exhibit.title = ? OR Image.title = ?) AND Image.id = Image_Exhibit.Image_id AND Exhibit.id = Image_Exhibit.Exhibit_id AND Photographer.id = Image.photographer_id ORDER BY Exhibit.title ASC");
		         }                             
			   			   
		       $select_exhibits->execute();
		   
		       $db_exhibits =$select_exhibits->fetchAll();
		       
		       for ($i=0; $i<count($db_exhibits); $i++){
			       $exhibit = new Exhibit();
			       $exhibit->setExhibitTitle($db_exhibits[$i]['Exhibit.title']);
			       $exhibit->setExhibitSubject ($db_exhibits[$i]['Exhibit.subject']);
			       $exhibit->setExhibitTheme ($db_exhibits[$i]['Exhibit.theme']);
			       $exhibit->setExhibitID($db_exhibits[$i]['exhibit_id']);
             
			    $select_images->execute([$exhibits->exhibit_id]);   
			    $db_images =$select_images->fetchAll();   
			    $images = array();   
			     for ($j=0; $j<count($db_images); $j++){
                    
                   $exhibit->setZipCode ($db_images[$j]['Photographer.zip_code']);    
                   $exhibit->setImageTitle ($db_images[$j]['Image.title']);
                   $exhibit->setImageSubject($db_exhibits[$j]['Image.subject']);
			       $exhibit->setImageDate($db_images[$j]['Image.date']);
                   $exhibit->setImageHour($db_images[$j]['Image.hour']);
                   $exhibit->setPixelXDimension($db_images[$j]['Image.pixel_x_dimension']);
                   $exhibit->setPixelYDimension($db_images[$j]['Image.pixel_y_dimension']);
                   $exhibit->setHorizontalResolution($db_images[$j]['Image.horizontal_resolution']);
                   $exhibit->setVerticalResolution($db_images[$j]['Image.vertical_resolution']);
                   $exhibit->setBitDepth($db_images[$j]['Image.bit_depth']);
                   $exhibit->setImageResolutionUnit($db_images[$j]['Image.image_resolution_unit']);
                   $exhibit->setColorRepresentation($db_images[$j]['Image.color_representation']); 
                   $exhibit->setCompression($db_images[$j]['Image.compression']);
				   $exhibit->setImageItemType($db_images[$j]['Image.image_item_type']); 
				   $exhibit->setImageURL($db_images[$j]['Image.image_url']);
		           $exhibit->setImagePhotographer_ID ($db_images[$j]['Image.photographer_id']);
			   }
			   
			       
				   $select_photographers->execute([$images->photographer_id]);   
			    $db_photographers =$select_photographers->fetchAll();   
			    $photographers = array();   
			     for ($k=0; $k<count($db_photographers); $k++){
				   
				   $exhibit->setPhotographerFirst_Name ($db_photographers[$k]['Photographer.first_name']);
                   $exhibit->setPhotographerLast_Name ($db_photographers[$k]['Photographer.last_name']);
                   $exhibit->setCity ($db_photographers[$k]['Photographer.city']);
                   $exhibit->setState ($db_photographers[$k]['Photographer.state']); 
                        	   
	    }   
		           array_push($exhibits, $exhibit);
		   }
		   
		           return $exhibits;
		   
		   
	   }catch (PDOException $e){
			   print_r ("Error reading Exibit from database: " .$e->getMessage() . "<br>\n");
			   
			   exit; 
	   	} 
		  
		     
       //End of Exhibit class
} 
}
?>
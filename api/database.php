<?php
class Database {
public $db;
public function getConnection(){
$this->db = null;
try{
$this->db = new mysqli("sql307.epizy.com","epiz_32645832","2CmhQDtnvhSbBom","epiz_32645832_AgcAssurance");
}catch(Exception $e){
echo "Database could not be connected: " . $e->getMessage();
}
return $this->db;
}
}
?>
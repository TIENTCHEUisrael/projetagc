<?php
class Client{
// dbection
private $db;
// Table
private $db_table = "Client";
// Columns
public $Client_id;
public $Nom;
public $photo;
public $Photo_Cni_Recto;
public $Photo_Cni_Verso;
public $Region;
public $CreatedAt;
public $No_Compte;
public $Telephone;
public $Password;
public $Email ;
public $Prenom;
public $Town;

// Db dbection
public function __construct($db){
$this->db = $db;
}

// GET ALL
public function getClients(){
$sqlQuery = "SELECT *  FROM " . $this->db_table . "";
$this->result = $this->db->query($sqlQuery);
return $this->result;
}

// CREATE
public function createClient(){
// sanitize
$this->Photo_Cni_Recto=htmlspecialchars(strip_tags($this->Photo_Cni_Recto));
$this->Nom=htmlspecialchars(strip_tags($this->Nom));
$this->Photo_Cni_Verso=htmlspecialchars(strip_tags($this->Photo_Cni_Verso));
$this->Town=htmlspecialchars(strip_tags($this->Town));
$this->Password=htmlspecialchars(strip_tags($this->Password));
$this->Email=htmlspecialchars(strip_tags($this->Email));
$this->photo=htmlspecialchars(strip_tags($this->photo));
$this->No_Compte=htmlspecialchars(strip_tags($this->No_Compte));
$this->Region=htmlspecialchars(strip_tags($this->Region));
$this->Telephone=htmlspecialchars(strip_tags($this->Telephone));
$this->Prenom=htmlspecialchars(strip_tags($this->Prenom));
$sqlQuery = "INSERT INTO
". $this->db_table ." SET Photo_Cni_Recto = '".$this->Photo_Cni_Recto."',
Nom = '".$this->Nom."',
Photo_Cni_Verso = '".$this->Photo_Cni_Verso."',
Town = '".$this->Town."',
Password = '".$this->Password."',
Email = '".$this->Email."',
photo = '".$this->photo."',
No_Compte = '".$this->No_Compte."',
Region = '".$this->Region."',
Telephone = '".$this->Telephone."',
 Prenom = '".$this->Prenom. "' Client_id = UUID()";
$this->db->query($sqlQuery);
if($this->db->affected_rows > 0){
return true;
}
return false;
}

// UPDATE
public function userAuthenticate(){
$sqlQuery = "SELECT * FROM 
". $this->db_table ." WHERE Telephone = '".$this->Telephone."' AND Password = '".$this->Password."'";
$record = $this->db->query($sqlQuery);
$dataRow=$record->fetch_assoc();
$this->Client_id= $dataRow['Client_id'];
$this->Telephone = $dataRow['Telephone'];
$this->Photo_Cni_Recto = $dataRow['Photo_Cni_Recto'];
$this->Nom = $dataRow['Nom'];
$this->Prenom = $dataRow['Prenom'];
$this->Photo_Cni_Verso = $dataRow['Photo_Cni_Verso'];
$this->Town = $dataRow['Town'];
$this->Password = $dataRow['Password'];
$this->Email = $dataRow['Email'];
$this->photo = $dataRow['photo'];
$this->No_Compte = $dataRow['No_Compte'];
$this->Region = $dataRow['Region'];
$this->CreatedAt = $dataRow['CreatedAt'];

}

// UPDATE
public function updateClient(){
    $this->Photo_Cni_Recto=htmlspecialchars(strip_tags($this->Photo_Cni_Recto));
    $this->Nom=htmlspecialchars(strip_tags($this->Nom));
    $this->Prenom=htmlspecialchars(strip_tags($this->Prenom));
    $this->Photo_Cni_Verso=htmlspecialchars(strip_tags($this->Photo_Cni_Verso));
    $this->Town=htmlspecialchars(strip_tags($this->Town));
    $this->Password=htmlspecialchars(strip_tags($this->Password));
    $this->Email=htmlspecialchars(strip_tags($this->Email));
    $this->photo=htmlspecialchars(strip_tags($this->photo));
    $this->No_Compte=htmlspecialchars(strip_tags($this->No_Compte));
    $this->Region=htmlspecialchars(strip_tags($this->Region));
    $this->CreatedAt=htmlspecialchars(strip_tags($this->CreatedAt));

$sqlQuery = "UPDATE ". $this->db_table ." SET Photo_Cni_Recto = '".$this->Photo_Cni_Recto."',
Nom = '".$this->Nom."',
Photo_Cni_Verso = '".$this->Photo_Cni_Verso."',
Town = '".$this->Town."',
Prenom = '" .$this->Prenom. "',
Password = '".$this->Password."',
Email = '".$this->Email."',
photo = '".$this->photo."',
No_Compte = '".$this->No_Compte."',
Region = '".$this->Region."' WHERE Telephone = '".$this->Telephone. "'";

$this->db->query($sqlQuery);
if($this->db->affected_rows > 0){
return true;
}
return false;
}

// DELETE
function deleteClient(){
$sqlQuery = "DELETE FROM " . $this->db_table . " WHERE Telephone = '".$this->Telephone. "'";
$this->db->query($sqlQuery);
if($this->db->affected_rows > 0){
return true;
}
return false;
}
}
?>
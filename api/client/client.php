<?php
class Client{
// dbection
private $db;
// Table
private $db_table = "Client";
// Columns
public $Identifiant;
public $Id;
public $Prenom;
public $Nom;
public $Sexe;
public $Nom_Societe;
public $Password;
public $Email ;
public $Photo;
public $Telephone;
public $Ville;
public $CreatedAt;


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
$this->Prenom=htmlspecialchars(strip_tags($this->Prenom));
$this->Nom=htmlspecialchars(strip_tags($this->Nom));
$this->Sexe=htmlspecialchars(strip_tags($this->Sexe));
$this->Nom_Societe=htmlspecialchars(strip_tags($this->Nom_Societe));
$this->Password=htmlspecialchars(strip_tags($this->Password));
$this->Email=htmlspecialchars(strip_tags($this->Email));
$this->Photo=htmlspecialchars(strip_tags($this->Photo));
$this->Telephone=htmlspecialchars(strip_tags($this->Telephone));
$this->Ville=htmlspecialchars(strip_tags($this->Ville));
$this->Identifiant=htmlspecialchars(strip_tags($this->Identifiant));
$sqlQuery = "INSERT INTO
". $this->db_table ." SET Prenom = '".$this->Prenom."',
Nom = '".$this->Nom."',
Sexe = '".$this->Sexe."',
Nom_Societe = '".$this->Nom_Societe."',
Password = '".$this->Password."',
Email = '".$this->Email."',
Photo = '".$this->Photo."',
Telephone = '".$this->Telephone."',
Ville = '".$this->Ville."',
Identifiant = '".$this->Identifiant."',Id = UUID()";
$this->db->query($sqlQuery);
if($this->db->affected_rows > 0){
return true;
}
return false;
}

// UPDATE
public function userAuthenticate(){
$sqlQuery = "SELECT * FROM 
". $this->db_table ." WHERE Identifiant = '".$this->Identifiant."' AND Password = '".$this->Password."'";
$record = $this->db->query($sqlQuery);
$dataRow=$record->fetch_assoc();
$this->Id= $dataRow['Id'];
$this->Identifiant = $dataRow['Identifiant'];
$this->Prenom = $dataRow['Prenom'];
$this->Nom = $dataRow['Nom'];
$this->Sexe = $dataRow['Sexe'];
$this->Nom_Societe = $dataRow['Nom_Societe'];
$this->Password = $dataRow['Password'];
$this->Email = $dataRow['Email'];
$this->Photo = $dataRow['Photo'];
$this->Telephone = $dataRow['Telephone'];
$this->Ville = $dataRow['Ville'];
$this->CreatedAt = $dataRow['CreatedAt'];

}

// UPDATE
public function updateClient(){
    $this->Prenom=htmlspecialchars(strip_tags($this->Prenom));
    $this->Nom=htmlspecialchars(strip_tags($this->Nom));
    $this->Sexe=htmlspecialchars(strip_tags($this->Sexe));
    $this->Nom_Societe=htmlspecialchars(strip_tags($this->Nom_Societe));
    $this->Password=htmlspecialchars(strip_tags($this->Password));
    $this->Email=htmlspecialchars(strip_tags($this->Email));
    $this->Photo=htmlspecialchars(strip_tags($this->Photo));
    $this->Telephone=htmlspecialchars(strip_tags($this->Telephone));
    $this->Ville=htmlspecialchars(strip_tags($this->Ville));
    $this->CreatedAt=htmlspecialchars(strip_tags($this->CreatedAt));

$sqlQuery = "UPDATE ". $this->db_table ." SET Prenom = '".$this->Prenom."',
Nom = '".$this->Nom."',
Sexe = '".$this->Sexe."',
Nom_Societe = '".$this->Nom_Societe."',
Password = '".$this->Password."',
Email = '".$this->Email."',
Photo = '".$this->Photo."',
Telephone = '".$this->Telephone."',
Ville = '".$this->Ville."' WHERE Identifiant = ".$this->Identifiant;

$this->db->query($sqlQuery);
if($this->db->affected_rows > 0){
return true;
}
return false;
}

// DELETE
function deleteClient(){
$sqlQuery = "DELETE FROM " . $this->db_table . " WHERE Identifiant = ".$this->Identifiant;
$this->db->query($sqlQuery);
if($this->db->affected_rows > 0){
return true;
}
return false;
}
}
?>
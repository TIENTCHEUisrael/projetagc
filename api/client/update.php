
<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../database.php';
include_once './client.php';

$database = new Database();
$db = $database->getConnection();
$item = new Client($db);

$item->Identifiant = isset($_GET['Identifiant']) ? $_GET['Identifiant'] : die();
$item->Prenom = $_GET['Prenom'];
$item->Nom = $_GET['Nom'];
$item->Sexe = $_GET['Sexe'];
$item->Nom_Societe = $_GET['Nom_Societe'];
$item->Password = $_GET['Password'];
$item->Email = $_GET['Email'];
$item->Photo = $_GET['Photo'];
$item->Telephone = $_GET['Telephone'];
$item->Ville = $_GET['Ville'];

if($item->updateClient()){
 echo json_encode(
    array("message" => "Succesfull."));
} else{
    echo json_encode(
    array("message" => "An error occured."));
}
?>
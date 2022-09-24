
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

$item->Telephone = isset($_GET['Telephone']) ? $_GET['Telephone'] : die();
$item->Nom = $_GET['Nom'];
$item->photo = $_GET['photo'];
$item->Prenom = $_GET['Prenom'];
$item->Photo_Cni_Recto = $_GET['Photo_Cni_Recto'];
$item->Photo_Cni_Verso = $_GET['Photo_Cni_Verso'];
$item->Region = $_GET['Region'];
$item->No_Compte = $_GET['No_Compte'];
$item->Password = $_GET['Password'];
$item->Email = $_GET['Email'];
$item->Town = $_GET['Town'];


if($item->updateClient()){
 echo json_encode(
    array("message" => "Succesfull."));
} else{
    echo json_encode(
    array("message" => "An error occured."));
}
?>
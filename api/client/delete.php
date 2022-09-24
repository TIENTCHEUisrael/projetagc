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

$item->Identifiant = isset($_GET['Identifiant']) ? $_GET['ide'] : die();

if($item->deleteClient()){
echo json_encode("Client deleted.");
} else{
echo json_encode("Data could not be deleted");
}
?>
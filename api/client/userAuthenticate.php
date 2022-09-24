
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
$item->Password = isset($_GET['Password']) ? $_GET['Password'] : die();
$item->userAuthenticate();
if($item->Nom != null){

// create array
$emp_arr = array(
"Client_id" => $item->Client_id,
"Nom" => $item->Nom,
"Prenom" => $item->Prenom,
"Password" => $item->Password,
"Email" => $item->Email,
"Telephone" => $item->Telephone,
"photo" => $item->Photo,
"Photo_Cni_Recto" => $item->Photo_Cni_Recto,
"Photo_Cni_Verso" => $item->Photo_Cni_Verso,
"Nom_Societe" => $item->Nom_Societe,
"Region" => $item->Region,
"No_Compte" => $item->No_Compte,
"Town" => $item->Town,
"CreatedAt" => $item->CreatedAt,
);
http_response_code(200);
echo json_encode($emp_arr);
}
else{
http_response_code(404);
echo json_encode("Client not found.");
}
?>
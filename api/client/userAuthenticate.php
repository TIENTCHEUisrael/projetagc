
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
$item->Password = isset($_GET['Password']) ? $_GET['Pass'] : die();
$item->userAuthenticate();
if($item->Nom != null){

// create array
$emp_arr = array(
"Id" => $item->Id,
"Identifiant" => $item->Identifiant,
"Prenom" => $item->Prenom,
"Nom" => $item->Nom,
"Sexe" => $item->Sexe,
"Nom_Societe" => $item->Nom_Societe,
"Password" => $item->Password,
"Email" => $item->Email,
"Photo" => $item->Photo,
"Telephone" => $item->Telephone,
"Ville" => $item->Ville,
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
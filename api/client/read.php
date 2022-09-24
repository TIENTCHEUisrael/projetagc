<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include_once '../database.php';
include_once './client.php';
$database = new Database();

$db = $database->getConnection();
$items = new Client($db);
$records = $items->getClients();
$itemCount = $records->num_rows;
echo json_encode($itemCount);
if($itemCount > 0){
$clientArr = array();
$clientArr["body"] = array();
$clientArr["itemCount"] = $itemCount;
while ($row = $records->fetch_assoc())
{
array_push($clientArr["body"], $row);
}
echo json_encode($clientArr);
}
else{
http_response_code(404);
echo json_encode(
array("message" => "No record found.")
);
}
?>
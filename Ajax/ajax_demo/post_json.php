<?php 
header('Access-Control-Allow-Origin: http://localhost/ajax_demo');  

include "_connexion.php";

$sRequete = "SELECT * FROM liens";
$result = $db->query($sRequete);

$aLiens = $result->fetchAll(PDO::FETCH_OBJ);
echo json_encode($aLiens);
// $result->closeCursor();
?>
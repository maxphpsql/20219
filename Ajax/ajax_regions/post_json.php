<?php 
// https://stackoverflow.com/questions/7564832/how-to-bypass-access-control-allow-origin
header('Access-Control-Allow-Origin: http://localhost/ajax_regions');  

include("_connexion.php");
$sRequete = "SELECT * FROM departements WHERE dep_reg_id=".$_POST["id"];
$result = $db->query($sRequete);
$aDepartements = $result->fetchAll(PDO::FETCH_OBJ);
echo json_encode($aDepartements);
?>
<?php 
/* --------------------------------------------------------
* _connexion.php
* --------------------------------------------------------- */

/* 
 * Salle vidéoprojecteur : il faut connaître le port MySql
 * 
 * mysql_default_socket
 * 
 * https://stackoverflow.com/questions/3736407/mysql-server-port-number
 * 
 * [HB, 24/07/2018]
 */
$db_user = "root";
$db_password = "";
$db_base = "ajax_regions";
$db_port = ini_get("mysqli.default_port");
$db_host = "localhost:".$db_port;

try 
{      
    $db = new PDO('mysql:host='.$db_host.';dbname='.$db_base.';charset=utf8', $db_user, $db_password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));   
} 
catch (Exception $e) 
{
   echo'Erreur : '.$e->getMessage().'<br>';
   echo'N° : '.$e->getCode(); 
   die('Fin du script');
}
?>
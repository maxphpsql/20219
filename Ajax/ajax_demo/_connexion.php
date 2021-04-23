<?php 
/* --------------------------------------------------------
* _connexion.php
* --------------------------------------------------------- */
try 
{      
   $db = new PDO('mysql:host=localhost;dbname=sites;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));   
} 
catch (Exception $e) 
{
   echo'Erreur : '.$e->getMessage().'<br>';
   echo'N° : '.$e->getCode(); 
   die('Fin du script');
}
?>
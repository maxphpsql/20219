<?php 
if (file_exists("_connexion.php")) 
{
    require "_connexion.php";    

    /*
    if (isset($_POST)) 
    {
       // var_dump($_POST);
       echo"<script>alert('Posté !');</script>";
    }
    */
    
    $str_requete = "SELECT * FROM liens WHERE id=".$_POST['id'];
    $result = $db->query($str_requete);
    
    // Solutions OK pour l'afpa 
    $lien = $result->fetch(PDO::FETCH_OBJ);
    
       echo $lien->titre."<br>";
}
?>
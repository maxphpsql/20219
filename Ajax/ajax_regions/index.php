<?php 
include("_connexion.php"); 

$sRequete = "SELECT * FROM regions";
$result = $db->query($sRequete);
$aRegions = $result->fetchAll(PDO::FETCH_OBJ);

// var_dump($aRegions);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Régions | Ajax démo</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <style>
  body{margin:10px} 
  </style>
</head>
<body> 
   <h1>Régions et départements</h1>
   <hr>
    <form>
       <div class="form-group row">
            <label for="regions" class="col-2 form-label text-right">Régions</label>
            <div class="col-6">
            <select name="regions" id="regions" class="form-control">
                <option selected disabled>Sélectionnez</option>     
                <?php
                foreach ($aRegions as $key => $oRegion) 
                {
                   echo"<option value='".$oRegion->reg_id."'>".$oRegion->reg_v_nom."</option>\n";   
                }
                ?>           
            </select>
            </div>
       </div>
       <div class="form-group row">
            <label for="departements" class="col-2 form-label text-right">Départements</label>
            <div class="col-6">
            <select name="departements" id="departements" class="form-control">
               <option selected disabled>Sélectionnez</option>     
            </select>
            </div>
       </div>       
    </form>
	<!--  Attention : Jquery sans slim sinon Ajax ne fonctionne pas -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="script.js"></script>
</body>
</html>
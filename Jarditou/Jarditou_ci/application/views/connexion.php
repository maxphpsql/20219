<?php
include("entete.php");
?>


<div class="container">
    <div class="row">
        <div class="col-lg-8 m-auto">
            <div class="card bg-dark mt-5 mb-5">
                <div class="card-title bg-primary text-white mt-5">
                    <h3 class="text-center py-3">Connexion</h3>
                </div>

                <?php
                            if(@$_GET['Empty']==true)
                            {

                            
                        ?>
                <div class="alert-light text-danger text-center py-3"><?php echo $_GET['Empty']?></div>
                <?php
                            }
                        ?>

                <?php
                            if(@$_GET['Invalid']==true)
                            {

                            
                        ?>
                <div class="alert-light text-danger text-center py-3"><?php echo $_GET['Invalid']?></div>
                <?php
                            }
                        ?>

                <div class="card-body">

                    <?php echo form_open("produits/connexion", array('class' => 'col-lg-12')); ?>

                    <input type="email" id="mail" name="mail" placeholder="Email" class="form-control mb-3">
                    <input type="password" id="mot_de_passe" name="mot_de_passe" placeholder="Mot de passe"
                        class="form-control mb-3">
                    <p style="color: white; font-size: 14px">Mot de passe perdu ?<a
                            href="http://localhost/Jarditou_ci/index.php/produits/mdp_perdu">Cliquez ici</a></p>
                    <button class="btn btn-success mt-3" name="login">Se connecter</button>

                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<h5 class="text-center">Vous n'avez pas de compte ?</h5>
<h5 class="text-center"><a href="http://localhost/Jarditou_ci/index.php/produits/inscription"
        style="color: #4169FE; text-decoration: underline">Inscrivez-vous</a></h5></br>



<?php
include("pieddepage.php");
?>
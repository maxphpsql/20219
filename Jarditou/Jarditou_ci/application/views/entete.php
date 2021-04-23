<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Site Jarditou - Bootstrap</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <!-- Bootstrap select pour styliser le menu déroulant dans formulaire -->
  <link rel="stylesheet" type="text/css"
    href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.12/dist/css/bootstrap-select.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.12/dist/css/bootstrap-select.min.css" rel="stylesheet">
  <!-- Feuille de style CSS -->
  <link rel="stylesheet" href="http://localhost/Jarditou_ci/assets\css\style.css">

  <!-- Penser par la suite à ajouter le lien vers le fichier normalize.css qui est une feuille de style dans laquelle on applique aux éléments HTML une réinitialisation des valeurs à 0 -->

</head>

<body>

  <!-- Un seul container qui englobe tout le site -->
  <div class="container">

    <!-- HEADER -->

    <!-- Une class="row" pour chaque bloc de texte -->
    <header class="row">
      <!-- Ecran moyen : 5 colonnes et Ecran large : 4 colonnes -->
      <div class="col-md-5 col-lg-4">
        <img src="http://localhost/Jarditou_ci/assets\images\jarditou_photos\jarditou_logo.jpg" class="img-fluid"
          alt="Logo jarditou" title="Logo jarditou">
      </div>
      <!-- Ecran moyen : 7 colonnes et Ecran large : 8 colonnes -->
      <div class="col-md-7 col-lg-8">
        <!-- Pour aligner le h1 à droite -->
        <h1 class="text-right">Tout le jardin</h1>
      </div>
    </header>

    <!-- NAVIGATION -->

    <!--Navbar-->
    <nav class="row navbar-expand-md">


      <!-- Navbar brand -->


      <!-- Collapse button -->
      <button class="navbar-toggler navbar-dark" type="button" data-toggle="collapse"
        data-target="#navbarSupportedContent15" aria-controls="navbarSupportedContent15" aria-expanded="false"
        aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

      <!-- Collapsible content -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent15">

        <!-- Links -->
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="http://localhost/Jarditou_ci/index.php/produits/index">Accueil <span
                class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="http://localhost/Jarditou_ci/index.php/produits/liste">Tableau</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="http://localhost/Jarditou_ci/index.php/produits/contact">Contact</a>
          </li>
          <?php
        if(isset($this->session->admin))
        {
            ?>
          <li class="nav-item">
            <a class="nav-link" href="http://localhost/Jarditou_ci/index.php/produits/ajout_produit">Ajouter un
              produit</a></li>
          <?php
        }
        ?>
        </ul>

        <ul class="navbar-nav mr-3">
          <!-- Permet de mettre "Connexion" et "Déconnexion" à droite dans la navbar -->
          <li class="nav-item mt-2">
            <a class="nav-link" href="http://localhost/Jarditou_ci/index.php/produits/afficherPanier"><img
                src="http://localhost/Jarditou_ci/assets\images\jarditou_photos\Shopping_cart_icon.svg.png" width="30" height="30"/>
              <?php if($this->session->panier) echo count($this->session->panier); else echo "0"; ?></a>
          </li>
          <?php
        if(empty($this->session->user ||  $this->session->admin))
        {
        ?>
          <li class="nav-item mt-2">
            <a class="nav-link" href="http://localhost/Jarditou_ci/index.php/produits/form_connexion">Connexion</a>
          </li>
          <?php
        }
      ?>
          <li class="nav-item mt-2">
            <a class="nav-link" href="http://localhost/Jarditou_ci/index.php/produits/deconnexion">Déconnexion</a>
          </li>
        </ul>

        <!-- Links -->

      </div>
      <!-- Collapsible content -->


    </nav>

    <!-- BANNIERE -->

    <!-- mb pour margin-bottom -->
    <div class="row">
      <img src="http://localhost/Jarditou_ci/assets\images\jarditou_photos\promotion.jpg" id="image"
        alt="Promotion sur les lames de terrasse" title="Promotion sur les lames de terrasse">
    </div>
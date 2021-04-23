<?php
/* --------------------------------------------------------
* PHP Phase 6 Dates et heures
*
* Exercice 7  
*
* Affichez l'heure courante sous cette forme : _11h25_.
* ---------------------------------------------------------- */

// Affiche 111125 (par exemple) car le 'h' minuscule est interprété
// comme instruction de formatage des heures  
echo date("Hhi");

// La solution est d'échapper le 'h' minuscule avec un antislash,
// celui est alors considéré comme du texte 
echo date("H\hi");
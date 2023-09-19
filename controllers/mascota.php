<?php

require_once '../models/Macota.php';

$mascota = new Mascota ();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
    case 'add':
      $parametros = [
        "nombre"       => $_POST['nombre'],
        "fotografia"   => $_POST['fotografia'],        
        "color"        => $_POST['color'],        
        "genero"       => $_POST['genero'],        
        "idCliente"    => $_POST['idCliente'],        
        "idRaza"       => $_POST['idRaza'],        

    ];
      echo json_encode($mascota->create($parametros));
      break;
  }
}

if(isset($_GET['operacion'])){
  switch($_GET['operacion']){
    case "getData":
      echo json_encode($mascota->search(['idMascota' => $_GET['idMascota']]));
    break;
  }
}
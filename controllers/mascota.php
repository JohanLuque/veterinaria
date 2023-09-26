<?php

require_once '../models/Macota.php';

$mascota = new Mascota ();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
    case 'add':
        $data = [
          "idCliente"   => $_POST['idCliente'],
          "idRaza"      => $_POST['idRaza'],
          "nombre"      => $_POST['nombre'],
          "fotografia"  => $_POST['fotografia'],
          "color"       => $_POST['color'],
          "genero"      => $_POST['genero']
        ];
        $mascota->create($data);
      break;
  }
}

if(isset($_GET['operacion'])){
  switch($_GET['operacion']){
    case "getData":
      echo json_encode($mascota->search(['idMascota' => $_GET['idMascota']]));
    break;

    case "readRaces":
      echo json_encode($mascota->readRaces(['idAnimal' => $_GET['idAnimal']]));
    break;
    case "lisAnimal":
      echo json_encode($mascota->lisAnimal());
    break;
    case "getPet":
      echo json_encode($mascota->listPet($_GET['idCliente']));
    break;
    case "getDetails":
      echo json_encode($mascota->detailsPet($_GET['idmascota']));
    break;
  }
}
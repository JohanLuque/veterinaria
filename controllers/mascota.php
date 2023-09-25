<?php

require_once '../models/Macota.php';

$mascota = new Mascota ();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
    case 'add':
        $nombre = $_POST['nombre'];
        $ruta = "../imagenes/$nombre.jpg" ;
        if($_POST['fotografia'] != ""){
          
        }
        $data = [
          "idCliente"   => $_POST['idCliente'],
          "idRaza"      => $_POST['idRaza'],
          "nombre"      => $nombre,
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
  }
}
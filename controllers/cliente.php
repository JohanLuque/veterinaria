<?php

require_once '../models/Cliente.php';
$cliente = new Cliente ();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
    case 'add':
      $parametros = [
        "apellidos"       => $_POST['apellidos'],
        "nombres"         => $_POST['nombres'],
        "dni"             => $_POST['dni'],
        "claveAcceso"     => $_POST['claveAcceso']
    ];
      echo json_encode($cliente->create($parametros));
      break;
    case "login":
      case 'add':
        $parametros = [
          "dni"             => $_POST['dni']
      ];
      echo json_encode($cliente->login($parametros));
      break;
  }
}

if(isset($_GET['operacion'])){
  
  switch($_GET['operacion']){
    case "getData":
      echo json_encode($cliente->search(['dni' => $_GET['dni']]));
    break;
  }
}
<?php

require_once '../models/Cliente.php';
$cliente = new Cliente ();

if(isset($_POST['operacion'])){

  switch($_POST['operacion']){
    case 'add':
      $claveOriginal = $_POST['claveAcceso'];
      $claveEncriptada = password_hash($claveOriginal, PASSWORD_BCRYPT);

      $parametros = [
        "apellidos"       => $_POST['apellidos'],
        "nombres"         => $_POST['nombres'],
        "dni"             => $_POST['dni'],
        "claveAcceso"     => $claveEncriptada
    ];
      echo json_encode($cliente->create($parametros));
      break;
    
  }
}

if(isset($_GET['operacion'])){
  
  switch($_GET['operacion']){
    case "getData":
      echo json_encode($cliente->search(['dni' => $_GET['dni']]));
    break;
    case "readCustomer":
      echo json_encode($cliente->readCustomer());
    break;
    case "login":
      $respuesta = [
        "login"       => false,
        "apellidos"   => "",
        "nombres"     => "",
        "mensaje"     =>"",
        "idcliente"   => 0
      ];

      $data = $cliente->login($_GET['dni']);
      $claveIngresada = $_GET['claveAcceso'];

      if($data){
        if(password_verify($claveIngresada, $data['claveAcceso'])){
          $respuesta['login'] = true;
          $respuesta['apellidos'] = $data['apellidos'];
          $respuesta['nombres']   = $data['nombres'];
          $respuesta['idcliente'] = $data["idCliente"];
        }else{
          $respuesta['mensaje'] = 'Contraseña incorrecta';
        }
      }else{
        $respuesta['mensaje'] = 'El usuario no existe'; 
      }
      echo json_encode($respuesta);
      break;
  }
}
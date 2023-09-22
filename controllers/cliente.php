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
    case "login":
      $respuesta = [
        "login"       => false,
        "apellidos"   => "",
        "nombres"     => "",
        "mensaje"     =>""
      ];

      $data = $cliente->login($_POST['dni']);
      $claveIngresada = $_POST['claveAcceso'];

      if($data){
        if(password_verify($claveIngresada, $data['claveAcceso'])){
          $respuesta['login'] = true;
          $respuesta['apellidos'] = $data['apellidos'];
          $respuesta['nombres']   = $data['nombres'];
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

if(isset($_GET['operacion'])){
  
  switch($_GET['operacion']){
    case "getData":
      echo json_encode($cliente->search(['dni' => $_GET['dni']]));
    break;
  }
}
<?php

require_once 'Conexion.php';

Class Cliente extends Conexion{
  
  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function create($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_registrar_clientes(?,?,?,?)");
      $query->execute(
        array(
            $data['apellidos'],
            $data['nombres'],
            $data['dni'],
            $data['claveAcceso']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }
  public function search($data= []){
    try{
      $query = $this->connection->prepare("CALL spu_buscar_clientes(?)");
      $query->execute(
        array(
            $data['dni'],
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function login($dni=""){
    try{
      $query = $this->connection->prepare("CALL spu_login_clientes(?)");
      $query->execute(array($dni));
      return $query->fetch(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function readCustomer(){
    try{
      $query = $this->connection->prepare("CALL spu_listar_clientes()");
      $query->execute();
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}
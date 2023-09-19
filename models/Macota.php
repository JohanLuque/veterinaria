<?php

require_once 'Conexion.php';

class Mascota extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function create($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_registrar_mascotas(?,?,?,?,?,?)");
      $query->execute(
        array(
            $data['nombre'],
            $data['fotografia'],
            $data['color'],
            $data['genero'],
            $data['idCliente'],
            $data['idRaza'],
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function search($data= []){
    try{
      $query = $this->connection->prepare("CALL spu_search_mascotas(?)");
      $query->execute(
        array(
            $data['idMascota'],
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}
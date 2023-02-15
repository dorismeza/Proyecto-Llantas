<?php
//conexion a la base de datos

$host     = 'localhost';
$bd       = 'proyecto';
$usuario    = 'root';
$clave = '12345678';

$conexion = mysqli_connect($host,$usuario,$clave,$bd);
$conection = @mysqli_connect($host,$usuario , $clave, $bd);
if(!$conection){
    echo"Error en la conexion:";
    }
?>
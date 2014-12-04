<?php
include("security.php");
$claveUsuario = $_SESSION["clave"];
?>

<?php
/**
 * Created by PhpStorm.
 * User: Migue
 * Date: 22/10/14
 * Time: 08:48 PM
 */
require "../bd/bd.php";
require"Evaluar.php";
$evaluacion = new Evaluar();
$evaluacion->evaluarPreguntas($claveUsuario);
<?php
include("clases/security.php");
$claveUsuario = $_SESSION["clave"];
?>
<?php include("templates/header.php"); ?>
<?php
require("templates/menu.php");
require("clases/Evaluar.php");
require("bd/bd.php");
$evaluacion = new Evaluar();
$evaluacion->mostrarUsuario($claveUsuario);
$evaluacion->mostrarResultados($claveUsuario);
?>
<?php
/**
 * Created by PhpStorm.
 * User: Migue
 * Date: 20/10/14
 * Time: 07:40 PM
 */
require 'helpers.php';
if(empty($_GET['url']))
    $_GET['url']='home';

controller($_GET['url']);

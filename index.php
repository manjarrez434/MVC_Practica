<?php
/**
 * Created by PhpStorm.
 * User: Migue
 * Date: 20/10/14
 * Time: 07:03 PM
 */
require("clases/Login.php");
require 'templates/header.php';
$login = new Login();
$login->mostrarFormulario();


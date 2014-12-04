<?php
/**
 * Created by PhpStorm.
 * User: Migue
 * Date: 20/10/14
 * Time: 07:33 PM
 */

$titulo="Bienvenido al Examen de Conocimientos Generales";
$contenido="<h3>Instrucciones:</h3>
 <ul>
  <li>Contesta todas las preguntas seleccionando la opción correcta</li>
  <li>Una vez culminado, clic en el boton EVALUAR</li>
  <li><strong>El resultado del examen aparecerá debajo del boton EVALUAR</strong></li>
  <li><strong>El minimo de aciertos son 8</strong></li>
</ul>";

$variables=array('titulo'=>$titulo,'contenido'=>$contenido);//serializar los datos

view('home',$variables);//('en donde estoy',$variables a mandar)
$pregunta = new Evaluar();
$pregunta->generarPreguntas();
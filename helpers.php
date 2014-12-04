<?php
/**

 * 1.- Funcion controller: Establecer la ruta de archivos controller
 * 2.- Funcion View: Establecer la ruta de archivos view
 */

function view ($plantilla, $variables = array())
{
    extract($variables);
    require ('views/'.$plantilla.'.tpl.php');
}
function controller($nombre)//Pagina que se quiere desplegar
{
    if(empty($nombre))
        $nombre = 'home';

    $archivo = "controllers/$nombre.php";

    if(file_exists($archivo))
        require ($archivo);
    else
        echo"Error, archivo no encontrado";
}
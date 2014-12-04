<?php
class Evaluar{
    public function mostrarUsuario($id)
    {
        $sql="SELECT CONCAT(Nombre, ' ' ,ApellidoPaterno, ' ' ,ApellidoMaterno) AS ncompleto FROM usuario WHERE id = $id";
        $query=mysql_query($sql) or die ("Error al mostrar usuario");
        $ncompleto=mysql_result($query,0,'ncompleto');
        echo"<pre><strong>USUARIO: $ncompleto.</strong></pre>";
    }
    public function generarPreguntas()
    {
        echo"<form id='frmdo' name='frmdo'>";
        echo"<div class=table-responsive>";
        echo"<table class=\"table table-striped\">";
        $sql="SELECT id,question FROM pregunta ORDER BY RAND() LIMIT 10";
        $consulta=mysql_query($sql) or die ("Error al generar preguntas".mysql_error());
        for($contador = 0;$contador < 10; $contador++)
        {
            $id=mysql_result($consulta,$contador,'id');
            $question=mysql_result($consulta,$contador,'question');
            $numero=$contador + 1;
            echo"<tr><td>".$numero.".-$question</td></tr>";
            echo"<tr>";
            echo"<td>";
            echo"<input type='radio' name='_answer".$contador."' value='si'>Si &nbsp ";
            echo"<input type='radio' name='_answer".$contador."' value='no'>No &nbsp ";
            echo"<input type='radio' name='_answer".$contador."' value='tal vez'>Tal Vez &nbsp ";
            echo"<input type='hidden' name='_idpregunta".$contador."' value='$id'>";
            echo"</td>";
            echo"</tr>";

        }
        echo"</table>";
        echo"</div>";
        echo"<p align='center'><input type='button' value='Evaluar' id='Evaluar' name='Evaluar' class='btn btn-success'></p>";
        echo"</form>";
        echo"<div id='ajax'></div>";
        echo'<script type="text/javascript">
                $(function(){
                   $("#Evaluar").click(function(){
                   if(confirm("¿Estas seguro que has respondido todas las preguntas?"))
                   {
                    $.ajax({
                           type: "POST",
                           url: "clases/TestEvaluar.php", //Script donde se ejecutará la administración.
                           data: $("#frmdo").serialize(), // Adjuntar los campos del formulario enviado.
                           success: function(data)
                           {
                               $("#ajax").html(data); // Mostrar la respuestas del script PHP.
                           }
                         });
                    }
                    return false; // Evitar ejecutar el submit del formulario.
                 });

                            });
                </script>';
    }
    public function evaluarPreguntas($_claveUsuario){
          $total = 0;
        for($i = 0; $i < 10; $i++)
        {
            if($_POST)
            {
                if(empty($_POST["_answer$i"]))
                {$answer = "tal vez";}
                else
                {$answer = $_POST["_answer$i"];}
                $idpregunta = $_POST["_idpregunta$i"];
            }
            $sql="SELECT id FROM pregunta WHERE id = $idpregunta AND answer = '$answer'";
            $consulta=mysql_query($sql);
            $num_resul=mysql_num_rows($consulta);
                if($num_resul > 0)
                $total = $total + 1;
        }
        $sqlAciertos="SELECT Aciertos FROM usuario WHERE id = $_claveUsuario";
        $consultaAciertos=mysql_query($sqlAciertos) or die ("Error al actualizar nuevos aciertos".mysql_error());
        $aciertosActuales=mysql_result($consultaAciertos,0,'Aciertos');
        if($total > $aciertosActuales)
        {
            if($total >= 8)
            {
                $sqlUpdate="CALL actualizarAciertos('$total',$_claveUsuario)";
                $consultaUpdate=mysql_query($sqlUpdate) or die ("Error al actualizar aciertos".mysql_error());
                echo"<div class='alert alert-success' role='alert'><strong>FELICIDADES:</strong> Haz aprobado el examen. Tus aciertos han sido actualizados en el sistema.</div>";

            }
            else
            {
                $sqlUpdate="CALL actualizarAciertos('$total',$_claveUsuario)";
                $consultaUpdate=mysql_query($sqlUpdate) or die ("Error al actualizar aciertos".mysql_error());
                echo'<div class="alert alert-warning alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                  <strong>LO SENTIMOS: Haz reprobado el examen.</strong>
                </div>';
            }
        }
        else
        {

            echo'<div class="alert alert-warning alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                  <strong>LO SENTIMOS: Haz reprobado el examen.</strong>
                </div>';
        }
    }
    public function mostrarResultados($_claveUsuario_)
    {
        $sql="SELECT Aciertos FROM usuario WHERE id = $_claveUsuario_";
        $consulta=mysql_query($sql) or die ("Error al mostrar aciertos".mysql_error());
        $aciertos=mysql_result($consulta,0,'Aciertos');
        if($aciertos >= 8)
        {
            echo"<div class='alert alert-success' role='alert'><strong>ACIERTOS:</strong> $aciertos (Ultima actividad registrada).</div>";
        }
        else
        {
            echo'<div class="alert alert-warning alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              <strong>ACIERTOS:</strong> '.$aciertos.'(Ultima actividad registrada).
            </div>';
        }
    }
}
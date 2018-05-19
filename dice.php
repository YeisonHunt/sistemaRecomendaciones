<?php
    include("conexion.php");
    /* Algoritmo sencillo usado para medir similitud entre parejas de videos */
    
    //Llamaremos parejas de videos para calcular similitud.
    $video1 = [];
    $video2 = [];

    //Para este caso, llamaremos los videos con id 2 y id 3.
    $sqlVideo1 = "SELECT * from videos inner join videos_has_categorias on videos.id = videos_has_categorias.idVideo
    where videos.id=2";
    $sqlVideo2 = "SELECT * from videos inner join videos_has_categorias on videos.id = videos_has_categorias.idVideo
    where videos.id=3";

    $result1 = $conn->query($sqlVideo1);
    $result2 = $conn->query($sqlVideo2);

    $contadorSimilitud = 0; //Se aumentara en 1 cada vez que tenga acierto algunas de las propiedades del video.

    //Transformamos los datos en vectores para poder comprar los datos de cada video.
    if ($result1->num_rows > 0) {
        // output data of each row
        while($row1 = $result1->fetch_array()) {
            
            $video1[] = $row1;
        }
    } else {
        echo "0 results";
    }

    if ($result2->num_rows > 0) {
        // output data of each  row
        while($row2 = $result2->fetch_array()) {
            
            $video2[] = $row2;
        }
    } else {
        echo "0 results";
    }


    //Extraemos las propiedades de los arrays del video1 y video2.
    $nombre1 = $video1[0]['nombre'];
    $nombre2 = $video2[0]['nombre'];

    $descripcion1 = $video1[0]['descripcion'];
    $descripcion2 = $video2[0]['descripcion'];

    $puntuacion1 = $video1[0]['puntuacion'];
    $puntuacion2 = $video2[0]['puntuacion'];

    $categoria1 = $video1[0]['idCategoria'];
    $categoria2 = $video2[0]['idCategoria'];


    //Cada vez que haya una similitud, en este caso exacta, se anadira 1 al contador de similitud.
    if($nombre1==$nombre2){

        $contadorSimilitud++;
    }
    if($descripcion1==$descripcion2){

        $contadorSimilitud++;
    }
    if($puntuacion1==$puntuacion2){

        $contadorSimilitud++;
    }
    if($categoria1==$categoria1){

        $contadorSimilitud++;
    }

    echo "La similitud entre los videos es de :".$contadorSimilitud;


    $conn->close();

?>
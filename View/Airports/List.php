<?php
session_start();
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de Aeroportos</title>

    <!-- Css -->
    <link rel="stylesheet" type="text/css" href="../../Public/Css/list.css">

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

    <!-- FaviIcon -->
    <link rel="icon" type="imagem/png" href="../../Public/Images/icon.png" />
</head>

<body>
    <?php
    if (isset($_SESSION['usuario'])) { ?>
        <div class="header">
            <h1>Airport Controller</h1>
            <h2>Listagem de Aeroportos</h2>
            <a href="./Index.php"><i class="fas fa-arrow-left"></i> Voltar</a>
        </div>
        <ul>
            <?php
            if (isset($_SESSION['airports'])) {
                include_once '../../Model/Airports.php';

                $airports = array();
                $airports = unserialize($_SESSION['airports']);

                foreach ($airports as $u) {
                    $id = $u['id'];
                    $texto = $u['nome'] . ' à ' . $u['distancia'] . 'km';
                    echo "<li>
                    <p class='text'>$texto</p>
                    <p class='delete'> <a href='../../Controller/AirportsController.php?operation=deletar&id=$id'><i class='fas fa-trash-alt'></i></a></p>
                    </li>";
                }

                unset($_SESSION['airports']);
            } else {
                header("location:../../Controller/AirportsController.php?operation=consultar");
            }
            ?>
        </ul>
    <?php } else {
        header("Location:../app.php");
    } ?>
</body>

</html>
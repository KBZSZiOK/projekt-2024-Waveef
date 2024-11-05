<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Srona główna</title>
    <link rel="stylesheet" href="css.css">
</head>
<body>
    <div id="banner"><h1>Baner</h1></div>
    <div id="nav">
        <a href="kino.php">Strona główna</a>
        <a href="tabela.php">Tabele</a>
        <a href="dodaj.php">Dodaj</a>
    </div>
    <div id="content">
        <form method="POST">
            Tytuł: <input type="text"><br>
            Reżyser: <input type="text"><br>
            Czas trwania<input type="text"><br>
            <input type="submit" value="Insert">
        </form>
    </div>
    <br><br>
    <div id="stopka">Stopka</div>
    <?php
        $sql = mysqli_connect("localhost", "root", "", "kino");
        $tytul = $_POST['tytul'];
        $rezuser = $_POST['rezyser'];
        $czastrwania = $_POST['czas_trwania'];
        $insert = "INSERT INTO `Filmy` VALUES (id, '$tytul', '$rezuser', $czastrwania)";
        mysqli_query($sql, $insert);
    ?>
</body>
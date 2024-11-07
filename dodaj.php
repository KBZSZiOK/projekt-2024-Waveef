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
        <a href="dodaj.php">Dodaj film</a>
    </div>
    <div id="content"><h1>Insert do "Filmy":</h1>
        <form method="POST">
            Tytuł: <input type="text" name="tytul"><br>
            Reżyser: <input type="text" name="rezyser"><br>
            Czas trwania:<input type="text" name="czas_trwania"><br>
            <input type="submit" value="Insert">
        </form><br><br><h1>Insert do "Klienci":</h1>
        <form method="POST">
            Imię: <input type="text" name="imie"><br>
            Nazwisko: <input type="text" name="nazwisko"><br>
            E-Mail:<input type="text" name="mail"><br>
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
        $imie = $_POST['imie'];
        $nazwisko = $_POST['nazwisko'];
        $mail = $_POST['mail'];
        $insert1 = "INSERT INTO `klienci` VALUES (id, '$imie', '$nazwisko', '$mail')";
        mysqli_query($sql, $insert1);
    ?>
</body>
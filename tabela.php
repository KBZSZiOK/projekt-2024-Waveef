<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Srona główna</title>
    <link rel="stylesheet" href="css.css">
</head>
<body>
    <div id="banner"><h1>Baner</h1></div>
    <div id="nav">
        <a href="index.html">Strona główna</a>
        <a href="tabela.php">Tabele</a>
        <a href="dodaj.php">Dodaj film</a>
    </div>
    <div id="content">
        <h1>Tabela Filmy:</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Nazwa</th>
                <th>Reżyser</th>
                <th>Czas Trwania</th>
            </tr>
            <?php
                $sql = mysqli_connect("localhost", "root", "", "kino");
                $tabele = "SELECT * FROM `Filmy`";
                $wynik = mysqli_query($sql, $tabele);
                while($rzad = $wynik->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $rzad['id'] . "</td>";
                    echo "<td>" . $rzad['tytul'] . "</td>";
                    echo "<td>" . $rzad['rezyser'] . "</td>";
                    echo "<td>" . $rzad['czas_trwania'] . " minut" . "</td>";
                    echo "</tr>";
                }
            ?>
        </table>
        <h1>Tabela Klienci:</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Imię</th>
                <th>Nazwisko</th>
                <th>E-mail</th>
            </tr>
            <?php
                $sql = mysqli_connect("localhost", "root", "", "kino");
                $tabele = "SELECT * FROM `klienci`";
                $wynik = mysqli_query($sql, $tabele);
                while($rzad = $wynik->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $rzad['id'] . "</td>";
                    echo "<td>" . $rzad['imie'] . "</td>";
                    echo "<td>" . $rzad['nazwisko'] . "</td>";
                    echo "<td>" . $rzad['mail'] . "</td>";
                    echo "</tr>";
                }
            ?>
        </table>
        
    </div>
    <br><br>
    <div id="stopka">Stopka</div>
</body>
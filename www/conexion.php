<?php
$host = "192.168.56.11"; // IP de la VM db
$dbname = "reto_db";
$user = "vagrant";
$pass = "vagrant";

try {
    $conn = new PDO("pgsql:host=$host;dbname=$dbname", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "<h2>Conexión exitosa a PostgreSQL ✅</h2>";

    $stmt = $conn->query("SELECT * FROM empleados");
    echo "<table border='1'><tr><th>ID</th><th>Nombre</th><th>Cargo</th></tr>";

    while ($row = $stmt->fetch()) {
        echo "<tr><td>{$row['id']}</td><td>{$row['nombre']}</td><td>{$row['cargo']}</td></tr>";
    }

    echo "</table>";

} catch (PDOException $e) {
    echo "<h3>Error de conexión: " . $e->getMessage() . "</h3>";
}
?>

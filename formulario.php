<html>
<body>

<?php
    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $email = $_POST["email"];
    $movil = $_POST["movil"];
    $edad = $_POST["edad"];

?>   

<?php
$servidor = "localhost";
$usuario = "root";
$password = "";
$basedatos = "empresaeventos";

// Crear conexión
$conn = new mysqli($servidor, $usuario, $password, $basedatos);
// Checkear conexión
if ($conn->connect_error) {
  die("Conexión fallida: " . $conn->connect_error);
}

$sql = "INSERT INTO participantes (nombre, apellido, correo, edad, telefono)
VALUES ('$nombre', '$apellido', '$email', $edad, '$movil')";

if ($conn->query($sql) === TRUE) {
  echo "Dado de alta satisfactoriamente";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

//coger el current idParticipante (aunque es un auto_Increment entonces es el max)
$idParticipante = $conn->query("SELECT MAX(IdParticipante) from participantes")->fetch_row()[0];

//if desarollo is checked
if (isset($_POST["desarrollo"])) {
  //crear una relacion con este participante y el sub evento(desarollo)
    $sql1 = "INSERT INTO detalleparticipante (IdSubEvento , IdParticipante)
    VALUES (1 ,$idParticipante)";
    $conn->query($sql1);
}

//if programacion is checked
if (isset($_POST["programacion"])) {
  //crear una relacion con este participante y el sub evento(programacion)
  $sql2 = "INSERT INTO detalleparticipante (IdSubEvento , IdParticipante)
  VALUES (2 ,$idParticipante)";
  $conn->query($sql2);
}

//if ingles is checked
if (isset($_POST["ingles"])) {
  //crear una relacion con este participante y el sub evento(ingles)
  $sql3 = "INSERT INTO detalleparticipante (IdSubEvento , IdParticipante)
  VALUES (3 ,$idParticipante)";
  $conn->query($sql3);
}

//if fol is checked
if (isset($_POST["fol"])) {
  //crear una relacion con este participante y el sub evento(fol)
  $sql4 = "INSERT INTO detalleparticipante (IdSubEvento , IdParticipante)
  VALUES (4 ,$idParticipante)";
  $conn->query($sql4);
}

// Cerrar conexión
$conn->close();
?>

</body>
</html>
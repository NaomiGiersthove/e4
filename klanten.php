<?php 

include "crudconfig.php";

$sql = "SELECT * FROM klanten";
$result = $conn->query($sql);

	// Database connectie en functies
    include 'database.php';

	// Database connectie om data op te halen uit de database
    $db = new database();

	// Select statement om data te verzamelen uit de database
    $klanten = $db->select("SELECT * FROM klanten",[]);

    $columns = array_keys($klanten[0]);
    $row_data = array_values($klanten);

    // Function klantgegevens editen
    if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['edit'])) {

        $klant_id = htmlspecialchars(trim($_POST['klant_id']));
        $naam = htmlspecialchars(trim($_POST['naam']));
        $telefoon = htmlspecialchars(trim($_POST['telefoon']));
        $email = htmlspecialchars(trim($_POST['email']));
        
        $db->edit_klanten($klant_id, $naam, $telefoon, $email);
    }

    // Function klantgegevens verwijderen
    if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['delete'])) {

        $klant_id = htmlspecialchars(trim($_POST['klant_id']));

        $db->select("DELETE FROM klanten WHERE ID = :klant_id",[':klant_id' => $klant_id]);
        header("refresh:1;");
        echo '<script>alert("Klantgegevens zijn succesvol verwijderd!")</script>';
    }

?>

<!DOCTYPE html>
<html>
    <title>Klanten</title>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

</head>

<body>
    <?php include_once 'navigatie.php'; ?>
    <div class="container">

        <h4>Klanten</h4>

<table class="table">

    <thead>
        <tr>
        <th>Naam</th>
        <th>Telefoon</th>
        <th>Email</th>
        <th><a href="createklant.php">+</th>
    </tr>
    </thead>

    <tbody> 

        <?php

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {

        ?>

        <tr>
            <td><?php echo $row['Naam']; ?></td>
            <td><?php echo $row['Telefoon']; ?></td>
            <td><?php echo $row['Email']; ?></td>
            
			<td><button type="submit" name="edit" onclick="return confirm('Doorgaan met bewerken?');">Edit</button></td>
		    <td><button type="submit" name="delete" onclick="return confirm('Doorgaan met verwijderen?');">Delete</button></td>

            <!-- <td><a href="updateklant.php"> <img src="edit.png" width="20" height="20" onclick="return confirm('Doorgaan met bewerken?');"></a>
            <td><a href="deleteklant.php"> <img src="delete.png" width="20" height="20" onclick="return confirm('Doorgaan met verwijderen?');"></a> -->
            
        </tr>  
        
        <?php       }
            }
        ?>                

    </tbody>

</table>


    </div> 

</body>

</html>

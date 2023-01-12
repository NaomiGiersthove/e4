<?php 

include "crudconfig.php";

    if (isset($_POST['update'])) {

        $naam = $_POST['naam'];
        $telefoon = $_POST['telefoon'];
        $email = $_POST['email'];


        $sql = "UPDATE `klanten` SET `naam`='$naam',`telefoon`='$telefoon',`email`='$email' WHERE `id`='$klant_id'"; 

        $result = $conn->query($sql); 

        if ($result == TRUE) {

            echo "Record updated successfully.";

        }else{

            echo "Error:" . $sql . "<br>" . $conn->error;

        }

    } 

if (isset($_GET['id'])) {

    $klant_id = $_GET['id']; 

    $sql = "SELECT * FROM `klanten` WHERE `id`='$klanten_id'";

    $result = $conn->query($sql); 

    if ($result->num_rows > 0) {        

        while ($row = $result->fetch_assoc()) {

            $naam = $row['naam'];

            $telefoon = $row['telefoon'];

            $email = $row['email'];

            $id = $row['id'];

        } 

    ?>

        <h2>User Update Form</h2>

        <form action="" method="post">

          <fieldset>

            <legend>Personal information:</legend>

            Naam:<br>

            <input type="text" name="naam" value="<?php echo $naam; ?>">

            <input type="hidden" name="klant_id" value="<?php echo $id; ?>">

            <br>

            Telefoon:<br>

            <input type="int" name="telefoon" value="<?php echo $telefoon; ?>">

            <br>

            Email:<br>

            <input type="email" name="email" value="<?php echo $email; ?>">

            <br>


            <br><br>

            <input type="submit" value="Update" name="update">

          </fieldset>

        </form> 

        </body>

        </html> 

    <?php

    } else{ 

        header('Location: klanten.php');

    } 

}

?> 

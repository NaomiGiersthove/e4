<?php 

include "crudconfig.php"; 

if (isset($_GET['id'])) {

    $klant_id = $_GET['id'];

    $sql = "DELETE FROM `klanten` WHERE `id`='$klant_id'";

     $result = $conn->query($sql);

     if ($result == TRUE) {

        echo "Record deleted successfully.";

    }else{

        echo "Error:" . $sql . "<br>" . $conn->error;

    }

} 

?>
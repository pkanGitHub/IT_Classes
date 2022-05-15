<?php
require('connection.php');

$sql = "SELECT * FROM person";
$personQ = $con->query($sql);
// $personQ = mysqli_query($con, "SELECT * FROM person");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Assignment 7</title>
</head>
<body>
    <h2>Phyllis Kan</h2>
    <?php $today = date('Y-m-d')?>
    <p><?= $today?></p>
    <table>
       <tr>
           <th>ID</th>
           <th>First Name</th>
           <th>Last Name</th>
           <th>Homewtown</th>
       </tr>
       <?php 
        // $row = $personQ->fetch_array();
        foreach($personQ as $row): 
       ?>
       <tr>
           <td><?= $row['id'] ?></td>
           <td><?= $row['fname'] ?></td>
           <td><?= $row['lname'] ?></td>
           <td><?= $row['hometown'] ?></td>
       </tr>
      <?php endforeach ?>
    </table>
    
</body>
</html>
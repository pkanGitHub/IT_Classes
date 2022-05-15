<?php
    session_start();
    $con = mysqli_connect("172.19.0.3", "dbuser", "dbpass", "db");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Assignment 8</title>
</head>
<body>
    <h2>Phyllis Kan</h2>
    <?php date_default_timezone_set("America/Chicago"); ?>
    <?php $today = date('Y-m-d h:i:sa')?>
    <p><?= $today?></p>
    <?php if(isset($_SESSION['username'])): ?>
        <h3>Welcome <?= $_SESSION['username'] ?>. Click here to <a href="logout.php" title="Logout">Logout</a></h1>
        <table>
       <tr>
           <th>ID</th>
           <th>First Name</th>
           <th>Last Name</th>
           <th>Homewtown</th>
       </tr>
       <?php 
        // $row = $personQ->fetch_array();
        $sql = "SELECT * FROM person";
        $personQ = $con->query($sql);
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
    
    <?php else:?>
        <h1>Welcome, please <a href="login.php" title="Login">login</a> first</h3>
    <? endif;?>
</body>
</html>
<?php
    session_start();
    require('connection.php');
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
           <th>Title</th>
           <th>Description</th>
           <th>Date</th>
       </tr>
       <?php 
        // $row = $personQ->fetch_array();
        $sql = "SELECT a.id, a.title, a.description, a.date 
                FROM calendar AS a 
                WHERE a.user_id = '".$_SESSION['user_id']."'";
        $calendarQ = $con->query($sql);
        foreach($calendarQ as $row): 
       ?>
       <tr>
           <td><?= $row['id'] ?></td>
           <td><?= $row['title'] ?></td>
           <td><?= $row['description'] ?></td>
           <td><?= $row['date'] ?></td>
       </tr>
      <?php endforeach ?>
    </table>
    
    <?php else:?>
        <h1>Welcome, please <a href="login.php" title="Login">login</a> first</h3>
    <? endif;?>
</body>
</html>
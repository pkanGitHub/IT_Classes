<?php include 'functions.php';?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Blackjack-style CardGame</title>
</head>
<body>
    <h2>Phyllis Kan</h2>
    <?php $today = date('Y-m-d')?>
    <p><?= $today?></p>
    <table>
        <tr>
            <th>Player 1 Main Deck</th>
            <th>Player 1 Side Deck</th>
            <th>Player 2 Main Deck</th>
            <th>Player 2 Side Deck</th>
        <tr/>
        <tr>      
            <td><?= mainDeck() ?></td>
            <td><?= sideDeck() ?></td>
            <td><?= mainDeck() ?></td>  
            <td><?= sideDeck() ?></td>
        <tr/>
    </table>

    <form method="POST" action="<?php echo $_SERVER['PHP_SELF'];?>">
        <label for="player1">Player1: </label>
        <input type="text" name="bet1" placeholder="Enter Bet">
        <input type="submit" name="p1Hit" value="Hit">
        <input type="submit" name="p1Stand" value="Stand">
        <br/>
        <label for="player2">Player2: </label> 
        <input type="text" name="bet2" placeholder="Enter Bet">
        <input type="submit" name="p2Hit" value="Hit">
        <input type="submit" name="p2Stand" value="Stand">
    </form>
    <form method="POST" action="<?php echo $_SERVER['PHP_SELF'];?>">
        <input type="submit" name="reset" value="Reset">
    </form>

    <?php

        session_start();

        if(!empty($_POST)){
            if(empty($_SESSION['Heeeelo'])){
                $_SESSION['Heeeelo'] = [];
            }
            $_SESSION['Heeeelo'][] = $_POST['session_text'];
        }

        $line1 = "";
        $line2 = "";
       
    if ($_SERVER["REQUEST_METHOD"] === "POST"){  

        if(isset($_POST['bet1']) || isset($_POST['bet2'])){
            $p1 = $_POST['bet1'];
            $p2 = $_POST['bet2'];

            if( $p1 === "" && $p2 === ""){
                echo "Please enter your bet";
            }else if(isset($_POST['p1Hit'])){
                $line1 =  "<h3>Player1 Hit</h3>";
                $line2 = "<h4>Bet $p1</h4>";
            }else if(isset($_POST['p1Stand'])){
                $line1 = "<h3>Player1 Stand</h3>";
                $line2 = "<h4>Bet $p1</h4>";
            }else if(isset($_POST['p2Hit'])){
                $line1 =  "<h3>Player2 Hit</h3>";
                $line2 = "<h4>Bet $p2</h4>";
            }else if(isset($_POST['p2Stand'])){
                $line1 = "<h3>Player2 Stand</h3>";
                $line2 = "<h4>Bet $p2</h4>";
            }else{
                print "nothing here";
            }
            echo "$line1 \n $line2"; 
        }else if (isset($_POST['reset'])){
            echo "reset";
        }
    }
    ?>

</body>
</html>
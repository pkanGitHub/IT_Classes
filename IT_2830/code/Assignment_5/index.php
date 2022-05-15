<?php 
    include 'functions.php';
    include 'game_logic.php';
?>

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
    <?php 
        print($_COOKIE['PHPSESSID']);
    ?>
    <?php if (!empty($_SESSION['player1']['main'])): ?>
    <table>
        <tr>
            <th>Player 1 Main Deck</th>
            <th>Player 1 Side Deck</th>
            <th>Player 2 Main Deck</th>
            <th>Player 2 Side Deck</th>
        <tr/>
        <tr> 
            <td><?= mainDeck('player1')?></td>
            <td><?= sideDeck() ?></td>
            <td><?= mainDeck('player2') ?></td>  
            <td><?= sideDeck() ?></td>
        <tr/>
    </table>
    <form method="POST" action="<?php echo $_SERVER['PHP_SELF'];?>">
        <label for="player1">Player1: </label>
        <input type="text" name="p1Bet" placeholder="Enter Bet">
        <input type="submit" <?= sumOver21('player1') ? "disabled" : "" ?> value="Hit">
        <input type="hidden" name="player" value="player1">
        <input type="submit" name="stand" value="Stand">
        <br/>
    </form>
    <form method="POST" action="<?php echo $_SERVER['PHP_SELF'];?>">
        <label for="player2">Player2: </label> 
        <input type="text" name="p2Bet" placeholder="Enter Bet">
        <input type="submit" <?= sumOver21('player2') ? "disabled" : "" ?> value="Hit">
        <input type="hidden" name="player" value="player2">
        <input type="submit" name="stand" value="Stand">
    </form>
    <?= game('player1') || game('player2'); ?> 
    <form method="POST" action="<?php echo $_SERVER['PHP_SELF'];?>">
        <input type="submit" name="reset" value="Reset">
    </form>
    <?php else: ?>
        <form method="POST" action="<?php echo $_SERVER['PHP_SELF'];?>">
            <input type="submit" name="begin" value="Begin">
        </form>
    <?php endif;?>
</body>
</html>

<?php
    // echo "<pre>";
    // print_r($_SESSION); 
    // print_r($_POST);
    // echo "</pre>";
?>
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
    
</body>
</html>
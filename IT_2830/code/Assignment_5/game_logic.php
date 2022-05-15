<?php
    session_start();
    $hit = isset($_POST['player']) ? $_POST['player'] : ""; 
   
    if (isset($_POST['begin'])){

        if(empty($_SESSION['player1']['main'])){
            dealCard('player1');
        }
        if(empty($_SESSION['player2']['main'])){
            dealCard('player2');
        }
        if(empty($_SESSION['player1']['bet'])){
            $_SESSION['player1']['bet'][] = 0;
        }
        if(empty($_SESSION['player2']['bet'])){
            $_SESSION['player2']['bet'][] = 0;
        }
    }
    else if(!empty($_POST['reset']))
    {
            resetGame();
    }    
    else if(isset($_POST['p1Bet']) || isset($_POST['p2Bet']))
    {
        $p1bet = isset($_POST['p1Bet']) ? $_POST['p1Bet'] : '';
        $p2bet = isset($_POST['p2Bet']) ? $_POST['p2Bet'] : '';
        if (isset($_POST['stand'])) {

            echo "<h3>{$_POST['player']} Stand</h3>";
            return;
        }

        if(($_POST['player'] === 'player1' && $p1bet === "") || ($_POST['player'] === 'player2' && $p2bet === ""))
        {
            echo "Please enter your bet";
        }
        else if(($_POST['player'] === "player1"))
        {
            echo "<h3>Player1 Hit</h3>";
            echo "<h4>Total Bet: $p1bet</h4>";

            $_SESSION['player1']['bet'][] = $p1bet;

            // echo "<script>console.log('p1 bet: $p1bet')</script>";
            if($p1bet !== "" && $p1bet !== "0" && $p1bet !== 0){
               $total = array_sum($_SESSION['player1']['bet']);
            }
            echo "Total bet: $total";
        }
        else if($_POST['player'] === "player2")
        {
            echo "<h3>Player2 Hit</h3>";
            echo "<h4>Bet $p2bet</h4>";
            $_SESSION['player2']['bet'][] = $p2bet;
            if($p2bet !== "" && $p2bet !== "0" && $p2bet !== 0){
                $total = array_sum($_SESSION['player2']['bet']);
             }
             echo "Total bet: $total";
        }
        else
        {
            echo "nothing here";
        }
        if (isset($_POST['p1Bet']) && $_POST['p1Bet'] > 0) {
            dealCard('player1');
        }
        if (isset($_POST['p2Bet']) && $_POST['p2Bet'] > 0) {
            dealCard('player2');
        }
      
    }
?>
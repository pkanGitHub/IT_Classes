<?php

    function mainDeck($player){
        $sum = array_sum($_SESSION[$player]['main']);
        $cards = end($_SESSION[$player]['main']);
        print_r("$cards, Total: $sum");
    }
  
    function dealCard($player){
        $deck = '';
        $card = rand(1, 10);
        $deck .= "$card";
        $_SESSION[$player]['main'][]=$deck;
        // echo "<script>console.log('func card: $card')</script>";
    }

    function sideDeck(){
        $deck = array();
        for($i = 1; $i <=3; $i++){
            $num = rand(-5, 5);
            array_push($deck, $num);
            echo "<input type='submit' value='{$num}'>";
        }
    }

    function sumOver21($player){
        if (!isset($_SESSION[$player])) {
            return null;
        }
        return array_sum($_SESSION[$player]['main']) >= 21;      
    }

    function game($player){
        if(array_sum($_SESSION[$player]['main']) > 21){
            $playerBet = array_sum($_SESSION[$player]['bet']);
            echo "{$player} Lose the game and also lost $$playerBet";
        }
        else if (array_sum($_SESSION[$player]['main']) === 21)
        {
            print_r($_SESSION[$player]['bet']);
            $player1Bet = array_sum($_SESSION['player1']['bet']);
            $player2Bet = array_sum($_SESSION['player2']['bet']);

            if ($player === "player1")
            {
                echo "Player1 Wins! You have won $$player2Bet";
            }
            else if ($player === 'player2')
            {
                echo "Player2 Wins! You have won $$player1Bet";
            }
        }
    }

    function resetGame(){
        session_unset();
        session_destroy();
    }
?>
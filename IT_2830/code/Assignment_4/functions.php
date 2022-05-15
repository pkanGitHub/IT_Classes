<?php

    function mainDeck(){
        $num = rand(1, 10);
        echo $num;
    }

    function sideDeck(){
        $deck = array();
        for($i = 1; $i <=3; $i++){
            $num = rand(-5, 5);
            array_push($deck, $num);
        }
        $cardCount = 0;
        foreach($deck as $card){
            echo $card;
            $cardCount = $cardCount + 1;
            if($cardCount < count($deck)){
                echo ', ';
            }
        }
    }
?>
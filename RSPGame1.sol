pragma solidity ^0.4.18;

contract RSPGame {
    enum Rsp { Rock, Scissors, Paper }
    
    address player1;
    address player2;
    
    Rsp player1Choice;
    Rsp player2Choice;
    
    event Winner(string msg,address player);
    
    function play(Rsp choice) external {
        if ( player1 == address(0) ) {
            player1 = msg.sender;
            player1Choice = choice;
        }
        else if ( player2 == address(0) ) {
            player2 = msg.sender;
            player2Choice = choice;
        }
    }
    
    function judge() external {
        // ...
        emit Winner("Win",winner);
    }
}


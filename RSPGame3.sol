pragma solidity ^0.4.24;

contract RSP {
    enum Rsp { Rock, Scissors, Paper }
    
    address player1; address player2;
    
    Rsp player1Choice; Rsp player2Choice;
    
    bytes32 player1ChoiceHash; bytes32 player2ChoiceHash;
    
    event Winner(string msg,address player);
    
    function play(bytes32 choiceHash) external {
        if ( player1 == address(0) ) {
            player1 = msg.sender; player1ChoiceHash = choiceHash;
        }
        else if ( player2 == address(0) ) {
            player2 = msg.sender; player2ChoiceHash = choiceHash;
        }
    }
    
    function hashForChoice(Rsp choice,uint nonce) external pure returns (bytes32) {
        return keccak256(choice,nonce);
    }
    
    function submit(Rsp choice,nonce) external {
        if ( msg.sender == player1 ) {
            if ( keccak256(choice,nonce) == player1ChoiceHash ) {  player1Choice = choice; }
        }
        else if ( msg.sender == player2 ) {
            if ( keccak256(choice,nonce) == player2ChoiceHash ) { player2Choice = choice;}
        }
    }
}


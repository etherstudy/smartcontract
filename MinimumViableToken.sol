pragma solidity ^0.4.16;

contract MinimumViableToken {
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function MinimumViableToken(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;                         // Give the creator all initial tokens
     }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        balanceOf[msg.sender] -= _value;                                // Subtract from the sender
        balanceOf[_to] += _value;                                             // Add the same to the recipient
    }
}

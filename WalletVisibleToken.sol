pragma solidity ^0.4.16;

contract WalletVisibleToken {
    mapping (address => uint256) public balanceOf;

   event Transfer(address _from, address _to, uint _value);


    function WalletVisibleToken(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
    }

    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) revert();
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();

        balanceOf[msg.sender] -= _value;                    // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
        Transfer(msg.sender,_to,_value);
    }
}

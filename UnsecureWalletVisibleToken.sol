pragma solidity ^0.4.16;

contract UnsecureWalletVisibleToken {
    mapping (address => uint256) public balanceOf;

   event Transfer(address _from, address _to, uint _value);


    function UnsecureWalletVisibleToken(uint256 initialSupply) public {
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
    }

    function transfer(address _to, uint256 _value) public {
        balanceOf[msg.sender] -= _value;                    // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
        Transfer(msg.sender,_to,_value);
    }
}


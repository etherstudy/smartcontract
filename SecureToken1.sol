pragma solidity ^0.4.16;

contract SecureToken {
    mapping (address => uint256) public balanceOf;

    event Transfer(address _from, address _to, uint _value);

    function SecureToken(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address _to, uint256 _value) {
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();
        balanceOf[_to] += _value;

        if (balanceOf[msg.sender] < _value) revert();
        balanceOf[msg.sender] -= _value;

        Transfer(msg.sender, _to,  _value);
    }
}


pragma solidity ^0.4.16;

contract SecureToken {
    mapping (address => uint256) public balanceOf;

    function UnsecureToken(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address _to, uint256 _value) {
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();
        balanceOf[_to] += _value;

        if (balanceOf[msg.sender] < _value) revert();
        balanceOf[msg.sender] -= _value;
    }
}


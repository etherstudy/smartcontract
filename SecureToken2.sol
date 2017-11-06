pragma solidity ^0.4.16;

contract SecureToken {
    mapping (address => uint256) public balanceOf;

    function UnsecureToken(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address _to, uint256 _value) {
	// Checks
        if (balanceOf[msg.sender] < _value) revert();
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();

	// Effects
        balanceOf[_to] += _value;
        balanceOf[msg.sender] -= _value;

	// Interaction
    }
}


pragma solidity ^0.4.16;

contract SecureGeneralWalletCompatibleToken1 {
   string public name;
   string public symbol;
   uint8 public decimals;  

   mapping (address => uint256) public balanceOf;

   event Transfer(address _from, address _to, uint _value);

    function SecureGeneralWalletCompatibleToken1(string tokenName,string tokenSymbol,uint8 decimalUnits,uint256 initialSupply) public {
	name = tokenName;
	symbol = tokenSymbol;
	decimals = decimalUnits;
	balanceOf[msg.sender] = initialSupply;
    }

 function transfer(address _to, uint256 _value) public {
        if ( balanceOf[msg.sender] < _value ) revert();
        if ( balanceOf[_to] + _value < balanceOf[_to] ) revert();
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        Transfer(msg.sender,_to,_value);
  }
}


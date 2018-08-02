pragma solidity ^0.4.16;

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    if (a == 0) {
      return 0;
    }
    c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    return a / b;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}

interface ERC223Receiver { 
    function tokenFallback(address, uint, bytes) external; 
}

contract ERC223 {
    using SafeMath for uint;
    
   string public name;
   string public symbol;
   uint8 public decimals;

   mapping (address => uint256) public balanceOf;

   event Transfer(address _from, address _to, uint _value);

    function ERC223(string tokenName,string tokenSymbol,uint8 decimalUnits,uint256 initialSupply) public {
        name = tokenName;
        symbol = tokenSymbol;
        decimals = decimalUnits;
        balanceOf[msg.sender] = initialSupply;
    }

 function transfer(address _to, uint256 _value,bytes _data) public {
        uint codeLength;
        assembly { codeLength := extcodesize(_to) }
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        if(codeLength>0) {
            // Require proper transaction handling.
            ERC223Receiver receiver = ERC223Receiver(_to);
            receiver.tokenFallback(msg.sender, _value, _data);
        }
  }
}


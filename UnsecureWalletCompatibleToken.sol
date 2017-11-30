pragma solidity ^0.4.16;

contract UnsecureWalletCompatibleToken {
   string public constant name = "Wallet Compatible Token";
  string public constant symbol = "WCTKs";
  uint8 public constant decimals = 18;  

    mapping (address => uint256) public balanceOf;

   event Transfer(address _from, address _to, uint _value);

    function UnsecureWalletCompatibleToken(uint256 initialSupply) public {
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
    }

    function transfer(address _to, uint256 _value) public {
        balanceOf[msg.sender] -= _value;                    // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
        Transfer(msg.sender,_to,_value);
    }
}


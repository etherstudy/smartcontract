pragma solidity ^0.4.18;

contract FunctionCallLimit {
    uint public callCount = 0;
    
    /* Constructor */
    function FunctionCallLimit() public {
    }
    
    function recursiveCallPure(uint count) public pure returns (bool) {
        if ( count > 0 )
            return recursiveCallPure(count-1);
        return true;
    }
    
    function functionCall(uint count) public {
        callCount = 0;
        recursiveCall(count);
    }
    
    function recursiveCall(uint count) internal {
        count++;
        if ( count > 0 )
            recursiveCall(count-1);
    }
}

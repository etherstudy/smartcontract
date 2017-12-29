pragma solidity ^0.4.18;

contract GreeterV2 {
    string hello = "Hello";
    
    function sayHello() external view returns (string) {
        return hello;
    }
    
    function changeHello(string _hello) external {
        hello = _hello;
    }
}

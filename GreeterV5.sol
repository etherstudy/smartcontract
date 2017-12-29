pragma solidity ^0.4.18;

contract GreeterV5 {
    mapping ( string => string ) countryToHello;
    mapping ( string => string ) countryToGoodbye;
    
    function GreeterV3() public {
        countryToHello[""] = "Hello";    
    }
    
    function sayHello(string country) external view returns (string) {
        return countryToHello[country];
    }
    
    function changeHello(string country,string hello) external {
        countryToHello[country] = hello;
    }
    
    function sayGoodbye(string country) external view returns (string) {
        return countryToGoodbye[country];
    }
    
    function changeGoodbye(string country,string goodbye) external {
        countryToGoodbye[country] = goodbye;
    }

}

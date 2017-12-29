pragma solidity ^0.4.18;

contract GreeterV3 {
    mapping ( string => string ) countryToHello;
    
    function GreeterV3() external {
        countryToHello[""] = "Hello";    
    }
    
    function sayHello(string country) external view returns (string) {
        return countryToHello[country];
    }
    
    function changeHello(string country,string hello) external {
        countryToHello[country] = hello;
    }

    function deleteHello(string country) external {
	delete countryToHello[country];
    }
}

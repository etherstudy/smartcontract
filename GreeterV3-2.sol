pragma solidity ^0.4.18;

contract GreeterV3 {
    mapping ( string => string ) countryToHello;
    
    function GreeterV3() external {
        countryToHello[""] = "Hello";    
    }
    
    function sayHello(string country) external view returns (string) {
        string storage hello = countryToHello[country];
        bytes memory h = bytes(hello);
        if ( h.length == 0 )
            return countryToHello[""];
        return hello;
    }
    
    function changeHello(string country,string hello) external {
        countryToHello[country] = hello;
    }
}

pragma solidity ^0.4.18;

contract GreeterV8 {
    struct Greeting {
        string hello;
        string goodbye;
    }
    
    mapping (uint => Greeting) countryToGreeting;
    mapping (uint => string) countryToHello;
    mapping (uint => string) countryToGoodbye;
    mapping (string => uint) countryToEnum;

    enum Country { Global, Korea, Usa }

    address owner;
    
    function GreeterV3() public {
        owner = msg.sender;
        
	countryToHello[0] = "Hello";
        countryToGreeting[uint(Country.Global)] = Greeting("Hello","Goodbye");
        Greeting memory korean = Greeting({goodbye:"안녕!",hello:"안녕?"});
        countryToGreeting[uint(Country.Korea)] = korean;
        
        Greeting memory usa;
        usa.hello = "Hi";
        usa.goodbye = "Bye";
        
        countryToGreeting[uint(Country.Usa)] = usa;
        
        countryToEnum[""] = uint(Country.Global);
        countryToEnum["Korea"] = uint(Country.Korea);
        countryToEnum["Usa"] = uint(Country.Usa);
    }
    
    function sayHello1(uint country) external view returns (string) {
        return countryToHello[0];
    }

    function sayHello(uint country) external view returns (string) {
        return countryToGreeting[country].hello;
    }

    function sayHello(string country) external view returns (string) {
        return countryToGreeting[countryToEnum[country]].hello;
    }
    
    function changeHello(string country,string hello) external {
        countryToGreeting[countryToEnum[country]].hello = hello;
    }
    
    function sayGoodbye(string country) external view returns (string) {
        return countryToGreeting[countryToEnum[country]].goodbye;
    }
    
    function changeGoodbye(string country,string goodbye) external {
        countryToGreeting[countryToEnum[country]].goodbye = goodbye;
    }

    function kill() external {
        if ( msg.sender == owner )
            selfdestruct(owner);
    }
}

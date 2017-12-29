pragma solidity ^0.4.18;

contract GreeterV6 {
    struct Greeting {
        string hello;
        string goodbye;
    }
    
    mapping (string => Greeting) countryToGreeting;

    function GreeterV3() public {
        countryToGreeting[""] = Greeting("Hello","Goodbye");
        Greeting memory korean = Greeting({goodbye:"",hello:""});
        countryToGreeting["Korea"] = korean;
        
        Greeting memory usa;
        usa.hello = "Hi";
        usa.goodbye = "Bye";
        
        countryToGreeting["USA"] = usa;
    }
    
    function sayHello(string country) external view returns (string) {
        return countryToGreeting[country].hello;
    }
    
    function changeHello(string country,string hello) external {
        countryToGreeting[country].hello = hello;
    }
    
    function sayGoodbye(string country) external view returns (string) {
        return countryToGreeting[country].goodbye;
    }
    
    function changeGoodbye(string country,string goodbye) external {
        countryToGreeting[country].goodbye = goodbye;
    }

}

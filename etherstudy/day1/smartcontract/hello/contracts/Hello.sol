pragma solidity ^0.4.24;

contract Hello {
    string hello = "Hello,World!";

    function sayHello() public view returns (string) {
        return hello;
    }

    function changeHello(string _hello) external {
        hello = _hello;
    }

    mapping (string => string) hellos;

    function changeHelloByLang(string _lang, string _hello) external {
        hellos[_lang] = _hello;
    }

    function sayHelloByLang(string _lang) external view returns (string) {
        return hellos[_lang];
    }
}

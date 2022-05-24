pragma solidity ^0.5.11;

contract Event {
    event Log(address indexed sender, string message);
    event AnotherLog(); //An event can be instanciated without a entering any parameter

    function fireEvent() public {
        emit Log(msg.sender, "Hello, This is a blockchain Event");
        emit AnotherLog();
    }
}
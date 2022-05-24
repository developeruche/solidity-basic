pragma solidity >=0.5.0 <0.9.0;
// SPDX-License-Identifier: MIT

contract Todo {
    // Declaration of the structure
    // creating the stucture
    // read from within
    // update 

    struct Todo { // The struct makes it possible to create custom data type
        string text;
        bool completed;
    }

    Todo[] public todos;


    function create(string memory _text) public {
        todos.push(Todo(_text, false)); // This from my calucation this method of init sturct would save more gas
    }

    function get (uint _index) public returns(Todo)
}
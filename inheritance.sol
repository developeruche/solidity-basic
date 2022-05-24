// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract demo{
    string public sentence="hello from developeruche";
}


pragma solidity >=0.5.0 < 0.9.0;

contract Parent{
    string public str;
    address public manager 

    constructor() {
        str="hello world";
        manager= msg.sender;
    }

    function setter(string memory _str) public {
        str=_str;
    }
}

contract Child is Parent {
uint public x;
}


// Implementing the overide function

abstract contract Parent{ //abstract keyword was used because the contract congtains a function that is not implemented
    string public str;
    address public manager 

    constructor() {
        str="hello world";
        manager= msg.sender;
    }

    function setter(string memory _str) public virtual; //virtual keyword was used because the function was not implemented... this is done so it can be overrode when the function is inheritance
}

contract Child is Parent {
uint public x;

function setter(string memory _str) public override{
    str=_str
}
}






// Learning inheritance (This is from another class not codedamm)

/* 
- Inheritance
    - Inherit a function 
    - Override a function

- Passing parameter to parent constructor
    - fixed parmeter
    - variable parameter
 */

contract A {
    // contract A is the parent 
    function getContractName() public pure returns (string memory) {
        return "Contract A";
    }
 }

contract B is A {
    // to overide the function getContractName to return "Contract B", you should just create a function (getContractName) and return "Contract B"
    // NOTE: The contract signature when overriing a contract must be the same if not another function would be created and there would not be an form of inheritance
    function getContractName() public pure returns (string memory) {
        return "Contract A";
    }
}


// Passing Parameter into a parent contract
contract A {
    string public name;

    constructor (string memory _name) public {
        name = _name;
    }
}

contract B {
    constructor (string memory _name) A(_name) public {

    } 
}


// NOW: Going into mutiple inheritance (I want contract C to inherit Contract A and Contract B)
pragma solidity ^5.5.11;

contract A {
    function foo() public pure returns (string memory) {
        return "A";
    }
}

contract B {
    function bar() public pure returns (string  memory) {
        return "B";
    }
}

contract C is A, B{
 /* 
    If the contracts this is inheriting from has a function having the same name, the Contract C would inherit just one (A (1), B(0)) 
 */
}




// Explaning Inheritance using EVENT

contract A {
    event Log(string message);

    function foo() public {
        emit Log("A.foo was called");
    }
}

contract B is A {
    function foo() public {
        emit Log("B.foo was called");
        A.foo();
    }
}

contract C is A {
    function foo() public {
        emit Log("C.foo was called");
        A.foo();
    }
} 

contract D is B, C {

}


/* 
NOTE: 
When You use the keyword "super all the parent contracts would be call"

 */



//  =======
//  Calling the constructors of a parent contract

contract X {
    string public name;

    constructor (string memory _name) public {
        name = _name;
    }
}

contract B is X ("Inputing name here makes this fixed: This can only be done while developing the contract") {

}

contract C is X {
    constructor() X("Another way to hard code input") public {

    }
}

contract D is X {
    constructor(string memory _name) X(_name) public {
        
    }
}
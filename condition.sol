pragma solidity >=0.5.0 <0.9.0;
// SPDX-License-Identifier: MIT

contract IfElse{
    function checkEvenOdd(int arg_in ) public pure returns(string memory) {
        string memory str_return;

        if(arg_in < 0){
            str_return = "Please Enter a Postive number.";
        }else if (arg_in % 2 == 0){
            str_return = "string is an even number";
        }else {
            str_return = "string is a odd number.";
        }

        return str_return;
    }
}
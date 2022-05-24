// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Function{
    uint svar = 10;

    function returnStateVariable( ) public view returns(uint) {
        return svar;
    }

    function returnLocalVariable( ) public pure returns(uint) {
        uint svarlocal = 20;
        return svarlocal;
    }

    function svarSet(uint var_in_take) public {
        svar = var_in_take;
    }

    function svarGet() public view returns(uint) {
        return svar;
    }

}

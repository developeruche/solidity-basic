// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract loops {
 uint[5] public arr = [10, 20, 30, 40, 50];

 function createLoop() public {
        for (uint i = 0; i < arr.length; i++) {
            arr[i] = arr[i] * 2;
        }
    }

function returnArray() public view returns (uint[5] memory) {
        return arr;
    }
}


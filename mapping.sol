pragma solidity >=0.5.0 <0.9.0;
// SPDX-License-Identifier: MIT

contract Mapping {
    mapping(address => uint) public my_map;

    function get(address _addr) public view returns (uint) {
        my_map[_addr];
    }
    function set(address _addr, uint i) public {
        my_map[_addr] = i;
    }
    function remove(address _addr) public {
        delete my_map[_addr];
    }
}
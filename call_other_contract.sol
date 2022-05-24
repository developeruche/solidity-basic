/* 
Calling other contracts

Code Work
- Call non payable function in another contract 
- Call payable function in another contract

*/


contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    } 

    function setXandSendEther (uint _x) public payable returns (uint, uint) {
        x = _x;
        value = mag.value;

        returns (x, value);
    }
}










// this contract can even be on another file.sol
contract Caller {
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    } //This fucntion initalizes the callee contract in the parameter while the next didnt, it init the contract using a variable a

    function setFromAddress(address _addr, uuint _x) public {
        Callee callee = Callee(_addr);
        uint x = callee.setX(_x);
    }

    function setXAndSendEther (Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXandSendEther.value(msg.value)(_x);
    }
}
/* 
In this lession i would be coding up a contract to be able to call a function on another contract 
and allso call it fallback function


*/



contract CallReciever {
    event Revieved(address caller, uint amount, string messgae);

    function foo(string memory _message, uint _x) public payable returns (uint) {
        emit Revieved(msg.sender, msg.value, _message);

        return 1 + _x;
    }

    function () external payable {
        emit Revieved(msg.sender, msg.value, "Fallback function was called.");
    }
}

contract Caller {
    function testCallFoo(address payable _addr) public {
        (bool success, bytes memory data) = _addr.call.value(msg.value).gas(5000)(
            abi.encodeWithSignature("foo(string,uint256)", "Called a Function", 1234)
        );
    }

    function testCallFooDME(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("foo(string,uint256)", "Called a Function", 1234)
        );
    }
}
// Making the former contract an interface

interface contract Parent{
    // string public str;
    // address public manager 

    // constructor() {
    //     str="hello world";
    //     manager= msg.sender;
    // }

    function setter(string memory _str) external;
}

contract Child is Parent {
uint public x;
}



// Using interface to interacty with other contract
interface ICounter {
    function count () external view returns (uint);
    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count()
    }
}
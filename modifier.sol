pragma solidity ^0.8.7;


// This is a contract implementing modifer

contract ModifierContract {
    bool public paused;
    uint public count;


    function setPaused(bool _paused) external {
        paused = _paused;
    }

    // Here comes the modifier
    modifier modifyMe() {
        require(!paused, "paused");
        _;
    }

    // modifiers can also taken in parameter
    modifier cap(uint _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    function inc(uint _x) external modifyMe cap(_x) {
        count += 1;
    }


    // Here is a big one a sandwich modifier
    modifier sandwich() {
        // some code here
        count += 10;
        _; // perform the rest of the code (from the function it is modifing)
        // another code
        count += 2;
    }

    function dec() external sandwich {
        
    }
}
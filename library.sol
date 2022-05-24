library SafeMath {
    // This lib would prevent uint overflow
    function add(uint x, uint y) internal pure returns (uint) {
        uint z = x + y;
        require(z >=x, "uint overflow");

        return z;
    }
}

/* 
NOTE: When writing a contract, always use the safemath library which is opensource and developed by the openzipplen lib

 */
contract TestSafeMath {
    using SafeMath for uint; 
    /* 
        Usung A for B means
        attach functions from library A to type B

    */

    uint x = 123;

    uint public MAX_UINT = 2 ** 256 - 1; //this is the largest byte of intergers that can be used in solidity

    x.add(567); //method of application one
    SafeMath.add(x, 567); //Method of application two

    function testAdd (uint x, uint y) public pure (returns uint) {
        return x.add(y);
    }
}




// ======================= This another library ================================
library Array {
    function remove(uint[] storage arr, uint index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();

    }
}

contract TestArray {
    using Array for uint[];
    uint[] public arr;

    // creating a function to put some element into the array
    function testArrayRemove() public {
        for (uint i = 0; i < 3, i++) {
            arr.push(i);
        } //[0, 1, 2]
    }

    arr.remove(1); //[0,2]
}
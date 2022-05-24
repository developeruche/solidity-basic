/* 
This snippet would teach how to import local file and import contracts from github
 */

// This contract is the contract that would beimported and would also be in a different file.
contract Foo {
    string public name = "Foo";
}



//  This contract would be in another solidity contract file
import "./Foo.sol";

contract TestImport {
    // here is hoe the use the contract Foo from the imported local file
    Foo foo = new Foo();

    function getFooName () public view returns (string memory) {
        return foo.name();
    }
}
/* 
In the code snippet delegated call would be implemented and also  how a contract can be upgraded
*/


contract B {
   uint public num;
   address public sender;
   uint public value;

   function setVars(uint _num) public payable {
       num = _num;
       sender = msg.sender;
       value = msg.value;
   }
}

contract B2 {
   uint public num;
   address public sender;
   uint public value;

   function setVars(uint _num) public payable {
       num = 2 * _num;
       sender = msg.sender;
       value = msg.value;
   }
}

contract A {
   uint public num;
   address public sender;
   uint public value;

   function serVars(address _contract, uint _num) public payable {
       (bool success, bytes memory data) = _contract.delegatecall(
           abi.encodeWithSignature("setVars(uint265)", _num)
       );
   }
}
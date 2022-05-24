/* 
Contract that can create another contract
-  Pass fixed inputs to a new contracts
- manage many contracts from a single contract

Code work

- Create a new contract from an already existing contract
- send ether and creare a new contract
 */


 contract Car {
     string public model;
     address public owner;


     constructor (string memory _model, address _owner) public payable {
         model = _model;
         owner = _owner;
     }
 }


// this is the contract that would be creating other contracts
contract CarFactory {
    function create (address _owner, string memory _model) public {
        Car car = new  Car(_model, _owner);
    }

    function createAndSendEther (address _owner, string _model) public payable {
        Car car = (new Car).value(msg.value)(_model, _owner);
    }
}


/* 
this snippet would make sure that the owner of the car contract is alway the carFactory a also keep record of all the created cars

    Car[] public cars;

    function create (string memory _model) public {
        Car car = new  Car(_model, addrress(this));
    }

 */
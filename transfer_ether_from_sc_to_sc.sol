// In this contract i would be transferring ether from a smart contract to another smart contract programatically
contract EtherTransferTo {
    // make a function which enable this contract accept ether payment
    function () public payable {
        // this is all for this function there is no need for an order functionality here
    } 
    function getBalance() public returns (uint) {
        return address(this).balance;
    }
}

contract EtherTransferFrom {
    // I have to create an instance of the EtherTransferTo so i can get the address of the contract
    EtherTransferTo private _instance;
    function EtherTransferFrom() public {

    }
    function getBalance() public returns (uint) {
        return address(thi).balance;
    }
    function getBalanceOfInstance() public returns (uint) {
        // return address(_instance).balance;
        //  or
        return _instance.getBalance();
    }

    // giving the contract the ability of accepting ether (Without this if ether is transfer to this con tract that ether would be lost)
    function () public payable {
        // but is  what to transfer the ether gotten here to the EtherTransferTo contract immidately ether is ssent to this contract
        address(_instance).send(msg.value)
    }
}
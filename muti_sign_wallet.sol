// SPDX-License-Identifier: MIT 
pragma solidity >=0.5.0 < 0.9.0;

contract MultiSignWallet {
    address private _owner;
    mapping (address => uint8) private _owners; 

    // creating an access control modifer
    modifier isOwner() {
        require(msg.sender == _owner);
        _;
    }

    modifier validOwner() {
        require(msg.sender == _owner || _owners[msg.sender] == 1);
        _;
    }

    event DepositFunds(address from, uint amount);

    function MultiSignwallet() public {
        _owner = msg.sender;
    }
    function addOwners(address newOwner) isOwner public {
        _owners[newOwner] = 1;
    }

    function removeOwner(address existingOwner) isOwner public {
        _owners[existingOwner] = 0;
    }

    function deposit() validOwner public payable {
        emit DepositFunds(msg.sender, msg.value);
    }
    function withdraw(uint amount) validOwner public {
        require(address(this).balance >= amount);
        payable(msg.sender).transfer(amount);
    }
}
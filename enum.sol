pragma solidity >=0.5.0 <0.9.0;
// SPDX-License-Identifier: MIT


contract Order {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function ship() public {
        require(status == Status.Pending);
        status = Status.Shipped;
    }

    function acceptDelivery() public {
        require(status == Status.Shipped);
        status = Status.Accepted;
    }
}
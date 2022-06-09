// function to send ether from a contract (The right way)
function pay(address payable addr) public payable {
    (bool sent, bytes memory data) = addr.call{value: 100}("")
}
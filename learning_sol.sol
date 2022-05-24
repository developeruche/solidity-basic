// ===========================================================
// Here are some hits useful while programming iin solidity
// ===========================================================


// USE this
require(msg.sender == owner, "sender is not allowed");

// IN place of this
if (msg.sender == owner) {
    to.transfer(amount);
    return;
}
revert("sender is not allowed");



// FALLBACK funtion: This would help aviod
// lose of funds
fallback() external payable {
    payable(msg.sender).transfer(msg.value);
}

















// Here are some special variable

/* 

Block

Transaction Properties

block.coinbase (address payable)	Current block miner’s address
block.difficulty (uint)	Current block difficulty
msg.value (uint)	Number of wei sent with the message
block.number (uint):	Current block number
blockhash(uint blockNumber) returns (bytes32)	Gives hash of the given block and will only work for the 256
most recent block due to the reason of scalability.
block.timestamp: 	Current block timestamp as seconds since unix epoch
gasleft() returns (uint256):	Remaining gas
msg.sender (address payable)	Sender of the message (current call)
msg.sig (bytes4)	First four bytes of the calldata (i.e. function identifier)
now (uint)	Current block timestamp (alias for block.timestamp)
tx.gasprice (uint)	Gas price of the transaction
block.gaslimit (uint)	Current block gaslimit
tx.origin (address payable)	Sender of the transaction (full call chain)
msg.data (bytes calldata)	Complete calldata
Note:

The values of all members of msg can change for every external function call.
block.timestamp, now and blockhash as a source of randomness are not secure. Timestamp and the blockhash can be influenced by the miners.
2) ABI encoding and decoding functions:

Function

Properties

abi.decode(bytes memory encodedData, (…)) returns (…)	Decodes the given data, while the types are given in parentheses as second argument.
abi.encode(…) returns (bytes memory)	Encodes the given arguments
abi.encodePacked(…) returns (bytes memory)	Performs packed encoding of the arguments.
abi.encodeWithSelector(bytes4 selector, …) returns (bytes memory)	Encodes the given arguments starting from the second and prepends the given four-byte selector
abi.encodeWithSignature(string memory signature, …) returns (bytes memory)	Equivalent to abi.encodeWithSelector(bytes4(keccak256(bytes(signature))), …)`

 */
/* 
How to sign and verify a Message
==> Signing 
1. Creating message to sign 
2. Hash the massage 
3. Sign the hash (off  chain, keep your private key private this is the reason the signing is done offchain);

==> Verify 
1. Recreate hash from the original message
2. Recover signer from the signature 
3. Compare recovered signer to claimed signer

*/



contract VerifySignature {
    function getmessgaeHash (address _to, uint _amount, uint _nounce) public pure returns (bytes32) {
        return kaccak256(abi.encodePacked(_to, _amount, _message, _nonce));
    }

    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(
            "\x19Ethereum Signed Message:\n32",
            _messageHash
            ));
    }

    function splitSignature(bytes memory _sig) public pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(_sig.length == 65, "Invalid Signature Length.");
    }
    function recoverSigner(
        bytes32 _ethSignedMessageHash, bytes memory _signature
    ) public pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);

        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function verify(
        address _signer, 
        address _to, 
        uint _amount, 
        string memory _message, 
        uint _nonce, 
        bytes memory _signature) public pure returns (bool) {
            bytes32 messageHash = getmessgaeHash(_to, _amount, _message, _nounce);
            bytes32 ethSignedMessage = getEthSignedMessageHash(messageHash);

            return recoverSigner(ethSignedMessage, _signature) == _signer;
        }
}




/* I WOULD COMPLETE THIS CODE LATER WHEN I UNDERSTNAD AND NEED THIS CODE */
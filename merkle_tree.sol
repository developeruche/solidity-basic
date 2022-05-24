pragma solidity ^0.5.0;
// SPDX-License-Identifier: MIT

// this can be used to create a cryptographic proof that some transaction was made in the block
contract MerkleProof {
    function verify (bytes32[] memory proof, bytes32 root, bytes32 leaf, uint index) public pure returns (bool) {
        bytes32 hash = leaf; // this is the hash of the element we are going to be generating the merkle tree from

        //recomputing the markcle root
        for (uint i = 0; i < proof.length; i++) {
            if(index % 2 == 0) {
                // This runs if the index is even
                hash = keccak256(abi.encodePacked((hash, proof[i]))); // concatenating the hash of the left and the hash of the proof element to make a hash which would be the hash of the upperr node

            } else {
                // this runs if the index is odd
                hash = keccak256(abi.encodePacked(proof[i], hash));
            }

            index = index / 2; // divide the current index by two and round down
        }

        

        return hash == root; 
    }
}

// I would work on this later when it understnad the algorithm better

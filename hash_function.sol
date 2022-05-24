contract HashFunction {
    function hash(string memory _text, uint _num, address _addr)  public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }

    function collision(string memory _text, string memory _aontherText) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _anotherText));

        // to prevent collision
        return keccak256(abi.encode(_text, _anotherText));
    }
}


conttract GuessTheMagicWord {
    bytes32 public answer = 0xThisShuoldBeA32BytesData;

    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}
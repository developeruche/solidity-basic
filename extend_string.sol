// SPDX-License-Identifier: MIT 
pragma solidity >=0.5.0 <0.9.0;

library strings {
    function concat(string _base, string _value) internal returns(string) {
        // convert the string value to byte
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);

        string memory _tagValue = new string(_baseBytes.length + _valueBytes.length);

        // converting the _tagValue back to byte
        bytes memory _newsValue = bytes(_tagValue)
    }
}
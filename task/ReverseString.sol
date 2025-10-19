// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ReverseString {

    function reverseString(string memory input) public pure returns (string memory output){
        bytes memory inputbytes = bytes(input);
        uint length = inputbytes.length;
        bytes memory reverseBytes = new bytes(length);

        for(uint i = 0;i<length;i++){
            reverseBytes[i] = inputbytes[length-i-1];
        }
        return string(reverseBytes);
    }

}
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RomeConvertInt {
    mapping(bytes2 => uint256) public romanToInt;

    constructor() {
        romanToInt["I"] = 1;
        romanToInt["V"] = 5;
        romanToInt["X"] = 10;
        romanToInt["L"] = 50;
        romanToInt["C"] = 100;
        romanToInt["D"] = 500;
        romanToInt["M"] = 1000;
        romanToInt["IV"] = 4;
        romanToInt["IX"] = 9;
        romanToInt["XL"] = 40;
        romanToInt["XC"] = 90;
        romanToInt["CD"] = 400;
        romanToInt["CM"] = 900;
    }

    function convert(string memory input) public view returns (uint256) {
        require(bytes(input).length > 0, "Input cannot be empty");
        require(bytes(input).length <= 15, "Input exceeds maximum length");

        bytes memory inputBytes = bytes(input);
        uint256 total = 0;

        for (uint256 i = 0; i < inputBytes.length; ) {
            // Handle two-character combinations
            if (i + 1 < inputBytes.length) {
                bytes2 twoChar = bytes2(inputBytes[i]) | (bytes2(inputBytes[i + 1]) >> 8);
                if (romanToInt[twoChar] != 0) {
                    total += romanToInt[twoChar];
                    i += 2;
                    continue;
                }
            }

            // Handle single character
            bytes1 singleChar = inputBytes[i];
            require(romanToInt[singleChar] != 0, "Invalid Roman numeral character");
            total += romanToInt[singleChar];
            i += 1;
        }

        return total;
    }
}
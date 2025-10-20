// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerToRoman {
    struct RomanMapping {
        uint value;
        string symbol;
    }

    RomanMapping[] private romanNumerals;

    constructor() {
        initializeRomanNumerals();
    }

    function initializeRomanNumerals() internal {
        romanNumerals.push(RomanMapping(1000, "M"));
        romanNumerals.push(RomanMapping(900,  "CM"));
        romanNumerals.push(RomanMapping(500,  "D"));
        romanNumerals.push(RomanMapping(400,  "CD"));
        romanNumerals.push(RomanMapping(100,  "C"));
        romanNumerals.push(RomanMapping(90,   "XC"));
        romanNumerals.push(RomanMapping(50,   "L"));
        romanNumerals.push(RomanMapping(40,   "XL"));
        romanNumerals.push(RomanMapping(10,   "X"));
        romanNumerals.push(RomanMapping(9,    "IX"));
        romanNumerals.push(RomanMapping(5,    "V"));
        romanNumerals.push(RomanMapping(4,    "IV"));
        romanNumerals.push(RomanMapping(1,    "I"));
    }

    function convert(uint num) public pure returns (string memory) {
        require(num > 0 && num <= 3999, "Number out of Roman numeral range");

        bytes memory result = new bytes(20);
        uint index = 0;
        RomanMapping[13] memory localMappings = [
            RomanMapping(1000, "M"),
            RomanMapping(900,  "CM"),
            RomanMapping(500,  "D"),
            RomanMapping(400,  "CD"),
            RomanMapping(100,  "C"),
            RomanMapping(90,   "XC"),
            RomanMapping(50,   "L"),
            RomanMapping(40,   "XL"),
            RomanMapping(10,   "X"),
            RomanMapping(9,    "IX"),
            RomanMapping(5,    "V"),
            RomanMapping(4,    "IV"),
            RomanMapping(1,    "I")
        ];

        for (uint i = 0; i < localMappings.length; i++) {
            while (num >= localMappings[i].value) {
                bytes memory symbolBytes = bytes(localMappings[i].symbol);
                for (uint j = 0; j < symbolBytes.length; j++) {
                    result[index++] = symbolBytes[j];
                }
                num -= localMappings[i].value;
            }
            if (num == 0) break;
        }

        bytes memory finalResult = new bytes(index);
        for (uint i = 0; i < index; i++) {
            finalResult[i] = result[i];
        }

        return string(finalResult);
    }
}

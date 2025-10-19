// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract RomeConvertInt{

    mapping(bytes2 =>uint) public romeToInt;

    function convert(string memory input) public view returns(uint output){
        //参数检查
        require(bytes(input).length>0,"input is blank");
        require(bytes(input).length<=15,"input is too long");
        bytes memory inputBytes = bytes(input);

        uint total = 0;
        for(uint i = 0;i<inputBytes.length;i++){
            uint value = romeToInt[inputBytes[i]];
            //检查是否有下一个字符
            uint nextValue = i+1<inputBytes.length ? romeToInt[inputBytes[i+1]] : 0;
            //处理减法的情况(IV = V-I的情况)
            if(value<nextValue){
                total -=value;
            }else{
                total +=value;
            }
        }
        return total;

    }

   constructor(){
    romeToInt["I"] = 1;
    romeToInt["V"] = 5;
    romeToInt["X"] = 10;
    romeToInt["L"] = 50;
    romeToInt["C"] = 100;
    romeToInt["D"] = 500;
    romeToInt["M"] = 1000;
    romeToInt["IV"] = 4;
    romeToInt["IX"] = 9;
    romeToInt["XL"] = 40;
    romeToInt["XC"] = 90;
    romeToInt["CD"] = 400;
    romeToInt["CM"] = 900;
   }

}
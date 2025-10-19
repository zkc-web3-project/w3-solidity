// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentDemo {
    mapping(address=>uint256) balances;

    //接受ETH
    function deposit() public payable {
        balances[msg.sender] +=msg.value;
    }

    //查询当前余额
    function getCurrentValue() public payable returns (uint256){
        return msg.value;
    }

    //查询累计余额
    function getAllValue() public view returns(uint256){
        return balances[msg.sender];

    }

    
}
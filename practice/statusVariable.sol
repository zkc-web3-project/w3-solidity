// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract statusVariable{
    //状态变量 用户余额
    mapping(address=>uint) public balances;

    //状态变量 合约所有者
    address public owner;

    //常量 手续费
    uint public constant FEE_RATE = 1e18;

    //构造函数
    constructor(){
        owner = msg.sender;
    }

    //修改余额，存入
    function deposit() public payable {
        balances[msg.sender]+=msg.value;
    }

    //提现
    function withdraw(uint amout) public {
        require(balances[msg.sender]>=amout,"Insufficient balances");
        balances[msg.sender]-=amout;
        payable (msg.sender).transfer(amout);
    }
}
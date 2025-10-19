// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StateModiferDemo{
    uint public count = 0;

//pure 不读取且不修改状态
    function add(uint a, uint b) public pure returns (uint){
        return a + b;
    }
    
    //view 只读取状态，不修改状态
    function getCount() public view returns(uint){
        return count;
    }

    //default 可以读取并修改状态
    function getAndModify() public returns(uint){
        return ++count;
    }

    //payable 可接收以太币
    function deposite() public payable returns(uint){
        return count;
    }


}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TupleDemo{
    uint256 num = 12;
    mapping (address=>uint) public balances;


    function getTuple() public view returns(uint256 amount, uint bala){
        amount = num;
        bala = balances[msg.sender];
    }

    function getTupleAnother() public view returns(uint256,uint){
        return (num,balances[msg.sender]);
    }

    function test(int x,int y) public pure returns(int, string memory){
        if(x>y){
            return (x,"x is greater");
        }else{
            return (y,"y is greater");
        }

    }

   //初始化部署者余额
    constructor(uint initBalance){
        balances[msg.sender] = initBalance;
    }

    function getMsgSender() public view returns(address){
        return msg.sender;
    }


}
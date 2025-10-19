// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalInfo{
    function getBlockInfo() public view returns(uint,uint){
        return (block.number,block.timestamp);
    }

    function getMsgDetails() public payable returns(address,uint){
        return (msg.sender,msg.value);
    }

    function getContractDetails() public view returns(address,uint){
        return (address(this),address(this).balance);
    }

    function getHash(string memory input) public pure returns(bytes32){
        return keccak256(abi.encodePacked(input));
    }

}

contract Payment{
    function pay() public payable{

    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}

contract Auth{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function isOwner()public view returns(bool){
        return owner==msg.sender;
    }

}
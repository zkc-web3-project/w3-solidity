// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressType{

    struct Person{
         int age;
         string name;
    }

    //声明一个地址变量
    address public myAdress;

    //当前调用者的地址
    address public caller = msg.sender;

    //比较地址类型
    function compareAdress(address addr1,address addr2) public pure returns (bool){
        return addr1==addr2;
    }

    //地址类型转换
    function addressConvert(address addr) public pure returns(bytes memory){
        return abi.encodePacked(addr);
    }

    function getPerson() public pure returns(Person memory){  //引用类型如数组，字符串，结构体必须要用memory修饰，否则编译报错
        return Person(33,"lisi");
    }

    //获取地址的余额
    function getBalance(address addr) public view returns(uint256){
        return addr.balance;
    }

    //向地址转账
    function transfer(address payable addr,uint256 amount) public payable {
        addr.transfer(amount);
    }

    //调用地址的代码
    function callContract(address addr, bytes memory data) public returns(bool,bytes memory){
        (bool success,bytes memory result) = addr.call(data);
        return (success,result);
    }


}
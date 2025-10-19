// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBank {
    function deposit() external payable ;
    function withdraw(uint amount) external ;
    function getBalance() external view returns(uint256);
}

//合约实现银行接口
contract Bank is IBank {
    mapping(address => uint256) public balances;

    function deposit() external payable override {
        require(msg.value>0,"amount must great than 0");
        balances[msg.sender]+=msg.value;
    }

    function withdraw(uint amount) external override {
        require(balances[msg.sender]>=amount,"insufficient balance");
        balances[msg.sender]-=amount;
        payable (msg.sender).transfer(amount);
    }

    function getBalance() external view returns(uint256){
        return balances[msg.sender];
    }

}

//使用银行接口的合约

contract BankUser{
    function depositBank(address bankAddress) external payable {
        IBank bank = IBank(bankAddress);
        bank.deposit{value:msg.value}(); //这里特殊传入
    }

    function withdrawFromBank(address bankAddress,uint amount) external {
        IBank bank = IBank(bankAddress);
        bank.withdraw(amount);
    }

    function getBankBalance(address bankAddress) external view returns(uint256){
        IBank bank = IBank(bankAddress);
        return bank.getBalance();
    }

    fallback() external payable { }  //这里必须要有这两个函数，否则调用withdrawFromBank时会报错
    receive() external payable { }

}
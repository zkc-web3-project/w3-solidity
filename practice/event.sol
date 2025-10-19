// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyEvent{
    event Deposit(address indexed sender, uint amount);
    event Withdraw(address indexed receiver,uint amount);

    function deposit() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) external{
        emit Withdraw(msg.sender, amount);
    }
}
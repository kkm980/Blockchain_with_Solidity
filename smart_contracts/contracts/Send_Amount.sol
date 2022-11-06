// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Task{

    event Transfer(
        address indexed to,
        uint amount
    );

    function sendEther(address payable to, uint amount) external payable{
        require(address(this).balance>=amount, "Insufficient amount");
        to.transfer(amount);
        emit Transfer(to, amount);
    }

}
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Escrow{
    address public payer;
    address payable public payee;
    address public lawyer;
    uint public amount;
    bool public workDone;

    constructor(address _payer, address payable _payee, uint _amount){
        payer = _payer;
        payee=_payee;
        lawyer=msg.sender;
        amount=_amount;
        workDone=false;
    }

    function deposit() payable public{
        require(msg.sender==payer, "Sender must be a payer");
        require(address(this).balance<=amount,"cannot send more than required");
    }

    function submitWork() external{
        require(msg.sender==payee, "Sender must be a payee");
        workDone=true;
    }

    function release() public{
        require(msg.sender==lawyer, "Only lawyer can do this");
        require(address(this).balance==amount, "cannot releaSE bcz of insufficient fund");
        payee.transfer(amount);
    }
    function balanceOf() view public returns(uint){
        return address(this).balance;
    }
}
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract MultiSign {
    address[] public _owners;
    uint256 public _threshold;

    struct Transfer{
        uint256 id;
        address payable to;
        uint approvals;
        uint256 amount;
        bool sent;
    }


    Transfer[] public transfers;

    mapping(address => mapping(uint => bool)) public approvals;

    constructor (address[] memory owners, uint256 threshold) {
        _owners = owners;
        _threshold = threshold;
    }

    function getOwners() public view returns(address[] memory){
        return _owners;
    }

    function createTransaction(uint256 _amount, address payable recipient) external returns(bool) {
        transfers.push(
            Transfer(
                transfers.length,
                recipient,
                _amount,
                0,
                false
                )
            );
        return true;
    }

    function getTransactions() public view returns(Transfer[] memory) {
        return transfers;
    }

    function approveTransfer(uint256 id) public returns (bool) {
        require(transfers[id].sent == false, "Transfer has already been sent");
        require(approvals[msg.sender][id] == false, "You have already approved this transfer");
        approvals[msg.sender][id] = true;
        transfers[id].approvals++;
        if(transfers[id].approvals >= _threshold){
            transfers[id].sent = true;
            address payable to = transfers[id].to;
            uint256 amount = transfers[id].amount;
            to.transfer(amount);
        }
        return true;
    }

}
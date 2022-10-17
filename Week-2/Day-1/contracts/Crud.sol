// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CRUD{

    struct employee {
	   string name;
	   string email;
	   uint age;
	   address wallet;
    }

    employee[] public employees;

}
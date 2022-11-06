// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CRUD{

    struct employee {
	   string name;
	   string email;
	   uint256 age;
	   address wallet;
    }

    employee[] public employees;

    uint256 public totalEmployees;

    constructor(){
        totalEmployees=0;
    }

    function createEmployee(string memory name, string memory email, uint256 age, address wallet) public returns(uint256 _totalEmployees){
       employee memory new_employee = employee(name, email, age, wallet);
       employees.push(new_employee);
       totalEmployees++;
       return totalEmployees;
    }



    function compareString(string memory a, string memory b) internal pure returns(bool){
           return keccak256(abi.encodePacked(a))==keccak256(abi.encodePacked(b));
   }

    function updateEmployee(string memory name, string memory email) external returns(bool){
         for(uint i=0;i<totalEmployees; i++){
            if(compareString(employees[i].name, name)){
                employees[i].name=name;
                employees[i].email=email;
                return true;
            }
        }
        return false;
    }



   function deleteEmployees(string memory email) external returns(bool){
      require(totalEmployees>0);
      for(uint i=0;i<totalEmployees;i++){
        if(compareString(employees[i].email, email)){
            employees[i]=employees[totalEmployees-1];
            delete employees[totalEmployees-1];
             totalEmployees--;
             return true;
        }
      }
   }



   
   

}
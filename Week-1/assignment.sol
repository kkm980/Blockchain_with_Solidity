 // SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**

 * @title Storage

 * @dev Store & retrieve value in a variable

 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts

 */

contract First_assignment {



    string name;

    uint age;



    // constructor() public {



    // }



    // this setter function will take input from user as new_age

    //  in uint and update the age variable

    function set_age(uint new_age) public{

        age=new_age;

    }



    // this setter function will take input from user as new_name 

    // in string and update the name variable

    function set_name(string memory new_name) public{

        name=new_name;

    }



    // this getter function will get the name from contract 

    // and will return it. since we are not doing any update function so,

    //  using 'view' keyword only.

    function get_name() view public returns (string memory){

        return name;

    }







   // this getter function will get the age from the contract, 

   // multiply it by 2 and will return it. 

   // since we are not doing any update function so, using 'view' keyword only.

   // Also, to make it only externally avlbl and not to be used inside the contract, 

   // we use 'external' keyword

    function get_double_age() view external returns(uint){

        return age*2;

    }

}


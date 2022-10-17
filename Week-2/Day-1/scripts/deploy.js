// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  // const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  // const ONE_YEAR_IN_SECS = 365 * 24 * 60 * 60;
  // const unlockTime = currentTimestampInSeconds + ONE_YEAR_IN_SECS;

  // const lockedAmount = hre.ethers.utils.parseEther("1");

  const CRUD = await hre.ethers.getContractFactory("CRUD");
  const crud = await CRUD.deploy();

  await crud.deployed();
  
  // console.log(crud.address, "this is deployed address of CRUD application.")



  // console.log(
  //   `CRUD app deployed to ${crud.address}`
  // );


  const initial_employee_number=await crud.totalEmployees();

  const create_response=await crud.createEmployee
  (
    'Krishna Kant Mishra', 'krishnakantmishra980@gmail.com', 27, '0x5FbDB2315678afecb367f032d93F642f64180aa3'
  );
  const new_employee_number=await crud.totalEmployees();
  const first_employee=crud.employees(0);
  console.log(initial_employee_number, new_employee_number, first_employee);
  // console.log(createResponse, "this is response of createEmployee");
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

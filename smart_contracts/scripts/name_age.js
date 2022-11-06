
const hre = require("hardhat");

async function main() {

  const lockedAmount = hre.ethers.utils.parseEther("1");

  const Name_Age = await hre.ethers.getContractFactory("Name_Age");
  const name_age = await Name_Age.deploy("Krishna", 99);

  await lock.deployed();

  console.log(
    `Name_Age contract to ${name_age.address}`
  );
  const name=await name_age.getName();
  const age=await name_age.getAge();

  console.log("name is: ", name,"and age is: ", age);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
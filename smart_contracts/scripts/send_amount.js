const hre = require("hardhat");

async function main() {

  const lockedAmount = hre.ethers.utils.parseEther("1");

  const Send_Amount = await hre.ethers.getContractFactory("Same_Amount");
  const send_amount = await Send_Amount.deploy();

  await send_amount.deployed();

  console.log(
    `send_amount contract to ${send_amount.address}`
  );
  const send=await send_amount.sendEther();
  

  console.log("amount sent response is ", send);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
const hre = require("hardhat");

async function main() {

  const [lawyer, payer, payee]=await hre.ethers.getSigners();
  const Escrow=await hre.ethers.getContractFactory('Escrow');
  const escrow=await Escrow.deploy(payer.address, payee.address, 1*10**18);


  await escrow.deployed();
  await escrow.connect(payer).deposit({value:10000});
  await escrow.connect(payee).submitWork();
  const contract_balance=await escrow.balanceOf()
  console.log(
    `escrow contract deployed to ${escrow.address}`
  );

  console.log("contract balance was: ", contract_balance);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
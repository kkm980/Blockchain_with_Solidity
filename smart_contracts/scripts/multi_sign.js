const hre = require("hardhat");

async function main() {

  const [owner1, owner2, owner3 , receiver] = await hre.ethers.getSigners();

  const MultiSig = await hre.ethers.getContractFactory('MultiSign');
  const multiSig = await MultiSig.deploy
  ([owner1.address, owner2.address, owner3.address], 3);

  await multiSig.deployed();
  const createTransaction = await multiSig.createTransaction(3, receiver.address);
  const approveTransaction = await multiSig.connect(owner1).approveTransfer(0);
  const approveTransaction2 = await multiSig.connect(owner2).approveTransfer(0);

  console.log
  (
    createTransaction,approveTransaction, approveTransaction2
  );

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  console.log(
    "Deploying contracts with the account:",
    deployer.address
  );

  const SandraToken = await hre.ethers.getContractFactory("TESTNFT");
  const jandrasToken = await SandraToken.deploy();

  await jandrasToken.deployed();

  console.log("ERC721 deployed to:", jandrasToken.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
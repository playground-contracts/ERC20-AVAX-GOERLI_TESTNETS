const { expect } = require("chai");
const hre = require("hardhat");

describe("CreateERC20", function () {
  it("Should return correct name and symbol", async function () {
    const CreateERC20 = await hre.ethers.getContractFactory("CreateERC20");
    const myERC20Deployed = await CreateERC20.deploy("CreateERC20", "JANDRAS");
    await myERC20Deployed.deployed();

    expect(await myERC20Deployed.name()).to.equal("CreateERC20");
    expect(await myERC20Deployed.symbol()).to.equal("JANDRAS");
  });
});

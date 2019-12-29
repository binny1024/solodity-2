const ReentryAttack = artifacts.require("ReentryAttack");
const EtherStore = artifacts.require("EtherStore");
const {expectRevert, constants, BN} = require('@openzeppelin/test-helpers');
contract("GlobalVar and CallGlobalVar", async (accounts) => {
    let instance = await EtherStore.deployed();
    await reentryInstance= await ReentryAttack.deployed();

    // await instance.depositFunds.value(10)();
    await instance.depositFunds({from:accounts[0], value:web3.utils.toWei('10', 'ether')});
    console.log("balance",instance.balance);
    await  reentryInstance.putEtherStore({from:accounts[0], value:web3.utils.toWei('1', 'ether')});
});
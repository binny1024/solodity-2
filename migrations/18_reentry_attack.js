const ReentryAttack = artifacts.require("ReentryAttack");
const EtherStore = artifacts.require("EtherStore");

module.exports = async function(deployer) {
    let accounts = await web3.eth.getAccounts();
    await deployer.deploy(EtherStore,  {from: accounts[0]});
    await deployer.deploy(ReentryAttack,accounts[1], {from:accounts[0]});
};
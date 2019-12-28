const fallback = artifacts.require("Fallback");
module.exports = async  function(deployer) {
    let accounts = await web3.eth.getAccounts();
    let deployTx = await deployer.deploy(fallback, {from:accounts[0]});
};

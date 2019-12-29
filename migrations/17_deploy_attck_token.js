const AttackToken = artifacts.require("AttackToken");

module.exports = async function(deployer) {
    deployer.deploy(AttackToken, '100');
};
  
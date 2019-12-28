const Transfer = artifacts.require("Transfer");
contract("Transfer", async (accounts) => {
    it("should deployed successfully", async () => {
        let instance = await Transfer.at("0xE4242F0E6feaE54Cf2b72602f47084dFa018bc00");
        // let instance = await Transfer.deployed();
        console.log("\t\tdeploying done, contract hash is", instance.address);
        await web3.eth.sendTransaction(
            {
                from: accounts[0],
                to: instance.address,
                value: web3.utils.toWei('100', "ether")
            });
        await instance.send(accounts[1], web3.utils.toWei('1', 'ether'));
    });
});
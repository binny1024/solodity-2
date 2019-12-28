//const Fallback = artifacts.require("合约的名字");
const Fallback = artifacts.require("Fallback");
contract("Fallback", async (accounts) => {

    it("should deployed successfully", async () => {
        let instance = await Fallback.at("0xA836151c2cd73032170cbcef0F5c30f8fBffe603");
        console.log('contract hash is ', instance.address);
        let owner =  await instance.owner.call();
        console.log("owner:", owner);
        // console.log("\t\tdeploying done, contract hash is", instance.address);
        try {

            // await web3.eth.sendTransaction({from: accounts[0], to: instance.address, value: web3.utils.toWei('10', "ether")})
            console.log('msg.sender = ', accounts[0]);
            await instance.withdrawEther(web3.utils.toWei('1', "ether"), {from: accounts[0]});
        } catch (e) {
            console.log('error = ' + e.stack);
        }
    });

});
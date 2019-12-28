pragma solidity ^0.5.0;

contract Fallback {
    address payable public owner;
    constructor() public {
        owner = msg.sender;
    }
    function() payable external {
    }

    function withdrawEther(uint256 amount) public {
        require(msg.sender == owner, "only creator can  exec this method ");

        require(address(this).balance >= amount, "not enough balance");

        owner.transfer(amount);
    }

}
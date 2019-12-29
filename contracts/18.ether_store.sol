pragma solidity >=0.4.33 <0.6.0;
contract EtherStore{
    mapping (address => uint256) public balances;
    function depositFunds()public payable{
        balances[msg.sender] += msg.value;
    }
    function withdrawFunds(uint256  withdraw)public {
        require(balances[msg.sender]>=withdraw," balance not enough");
        require(msg.sender.call.value(withdraw)(),"something wrong");
        balances[msg.sender] -= withdraw;
    }
}
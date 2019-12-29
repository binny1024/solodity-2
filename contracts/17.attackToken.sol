pragma solidity ^0.5.0;


contract AttackToken {

    mapping (address => uint8) internal _balances;

    string public name = "AttactToken";
    string public symbol = "AT";
    uint8 private _totalSupply;

    constructor(uint8 tss) public {
        _totalSupply = tss;
        _balances[msg.sender] = tss;
    }
    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view returns (uint8) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view returns (uint8) {
        return _balances[account];
    }

    function batchTransfer(address[]  memory  from, uint8 amount) public {
        uint8 len = uint8(from.length);
        require(len > 0 && len <= 20, "address  too many");
        uint8 totalAmount = _balances[msg.sender];
        uint8 totalSenderAmount = amount * len;
        require(totalAmount >= totalSenderAmount, "the sender`s total amount is lower than the amounts");
        _balances[msg.sender] = _balances[msg.sender] - totalSenderAmount;
//        address(msg.sender).balance === the actual balance for eth of msg.sender
        for (uint8 i = 0; i < len; i++) {
            _balances[from[i]] = _balances[from[i]] + (amount);
        }
    }
}
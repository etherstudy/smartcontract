pragma solidity ^0.4.24;

contract ERC20 {
    string public name;
    string public symbol;
    uint256 public initialSupply;
    uint256 public maximumSupply;
    mapping (address => uint256) public balances;

    function transfer(address _to, uint256 _value) external {
        require( balances[msg.sender] >= _value);
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
    }

    function balanceOf(address _owner) external view returns(uint256) {
        return balances[_owner];
    }

    // string symbol, uint256 initialSupply, uint256 maximumSupply
    constructor(string _name,
        string _symbol,
        uint256 _initialSupply,
        uint256 _maximumSupply)
    public {
        name = _name;
        symbol = _symbol;
        initialSupply = _initialSupply;
        maximumSupply = _maximumSupply;

        balances[msg.sender] = initialSupply;
    }

}
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract Stake {
 string public name = "Stake";
    address public owner;
    IERC20 public token;

    address[] public stakers;
    mapping(address => uint) public balance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;

    constructor(IERC20 _token) public {
        token = _token;
    }

    function stakeToken(uint _amount) public {
        require(_amount > 0);

        token.transferFrom(msg.sender, address(this), _amount);

        balance[msg.sender] = balance[msg.sender] + _amount;

        if(!hasStaked[msg.sender]) {
            stakers.push(msg.sender);
        }

        isStaking[msg.sender] = true;
        hasStaked[msg.sender] = true;
    }

    function unstakeToken() public {

        uint balance = balance[msg.sender];

        require(balance > 0);

        token.transfer(msg.sender, balance);

        balance[msg.sender] = 0;

        isStaking[msg.sender] = false;
    }

}
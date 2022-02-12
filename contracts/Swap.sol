pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Swap {
  string public name = "Swap contract";
  IERC20 public token;
  uint256 public rate;

  event TokensPurchased(
    address account,
    address token,
    uint amount,
    uint rate
  );

  constructor(IERC20 _token , uint256 _rate) public {
    token = _token;
    rate = _rate;
  }

  function buyTokens() public payable {
    uint tokenAmount = msg.value * rate;

    require(token.balanceOf(address(this)) >= tokenAmount);

    token.transfer(msg.sender, tokenAmount);

    emit TokensPurchased(msg.sender, address(this), tokenAmount, rate);
  }


// function buyTokens() public payable {
//     // Calculate the number of tokens to buy
//     uint256 tokenAmount = msg.value * rate;

//     // uint256 tokenAmount1 = msg.value;
//     // uint256 tokenAmount2 = tokenAmount1 + 000000000000000000;
//     // uint256 tokenAmount = tokenAmount2 * rate;

//     // Require that EthSwap has enough tokens
//     require(token.balanceOf(address(this)) >= tokenAmount);

//     // Transfer tokens to the user
//     token.transfer(msg.sender, tokenAmount);

//     // Emit an event
//     emit TokensPurchased(msg.sender, address(token), tokenAmount, rate);
//   }






}
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Swap {
//     string public name = "Swap contract";
//     uint256 public rate;
//     IERC20 public token;

//     event TokensPurchased(
//     address account,
//     address token,
//     uint amount,
//     uint rate
//   );

//     constructor (IERC20 _token , uint256 _rate) public {
//         token = _token;
//         rate = _rate;
//     }

//     function buyTokens() public payable {
//         uint256 amount = msg.value * rate;

//         require(token.balanceOf(address(this))>= amount);

//         token.transferFrom(msg.sender, address(this), amount);

//         emit TokensPurchased(msg.sender, address(token), amount, rate);
//     }



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

    emit TokensPurchased(msg.sender, address(token), tokenAmount, rate);
  }


}
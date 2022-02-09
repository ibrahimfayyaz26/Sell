const Token = artifacts.require("Token");
const Swap = artifacts.require("Swap");

require("chai")
    .use(require("chai-as-promised"))
    .should();

function tokens(n) {
    return web3.utils.toWei(n, "ether");
}

contract("Swap", ([buyer, investor]) => {
    let token, swap;
    before(async () => {
        token = await Token.new();
        swap = await Swap.new(token.address, 2);
    });

    describe('buyTokens()', async () => {
        before(async () => {
         await swap.buyTokens({ from: investor, value: token("1")})
        })
      })
});
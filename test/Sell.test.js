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
      it('buyTokens', async () => {
        await token.transfer(swap.address,tokens("100"))
            await swap.buyTokens({ from: investor,value:web3.utils.toWei("1", "ether")})
       })
     });
      
});
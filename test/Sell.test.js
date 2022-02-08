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

    describe("Swap deployment", async () => {
        it("contract has a name", async () => {
            const name = await swap.name();
            assert.equal(name, "Swap contract");
        });
    });

    describe("buyTokens()", async () => {
        let result;

        before(async () => {
            // Purchase tokens before each example
            token.approve(swap.address, tokens("10000"))
            result = await swap.buyTokens({
                from: investor,
                value: web3.utils.toWei("0", "ether"),
            });
        });
        it("Buying token", async () => {
            const event = result.logs[0].args
            assert.equal(event.account, investor)
            assert.equal(event.token, token.address)
        });
    });
});
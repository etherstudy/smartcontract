var ERC20 = artifacts.require("./ERC20.sol");

var BigNumber = web3.BigNumber;

var assert = require('assert');
var should = require('chai')
    .use(require('chai-bignumber')(BigNumber))
    .should();

contract("ERC20", (accounts) => {
    describe("transfer", async function() {
        it("should transfer to recipient by the specified amount", async function() {
            const creator = accounts[2];
            let erc20 = await ERC20.new('ERC20','ERC20',1000,1000, {from: creator} );

            const recipient = accounts[1];
            const oneHundredTokens = 100;

            await erc20.transfer(recipient, oneHundredTokens);

            const recipientBalance = await erc20.balanceOf(recipient);

            recipientBalance.should.be.bignumber.equal(oneHundredTokens);
        })
    });

    describe("constructor", async function() {
        let erc20;
        let creator;

        beforeEach(async function() {
            creator = accounts[1];
            erc20 = await ERC20.new('ERC20','ERC20',1000,1000, {from: creator} );
        });

        it("Creator should have the initialSupply", async function() {
            const balance = await erc20.balanceOf(creator);

            balance.should.be.bignumber.equal(1000);
        });

        it("should have the specified name", async function() {
            const name = await erc20.name();
            name.should.be.equal('ERC20');
        });

        it("should have the specified symbol", async function() {
            const symbol = await erc20.symbol();
            symbol.should.be.equal('ERC20');
        });

        it("should have the specified initialSupply", async function() {
            const initialSupply = await erc20.initialSupply();

            initialSupply.should.be.bignumber.equal(1000);
        });

        it("should have the specified maximumSupply", async function() {
            const maximumSupply = await erc20.maximumSupply();

            maximumSupply.should.be.bignumber.equal(1000);
        });
    });
});

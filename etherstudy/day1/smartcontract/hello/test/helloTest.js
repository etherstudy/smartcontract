var Hello = artifacts.require("./Hello.sol");

var assert = require('assert');
var should = require('chai').should();

console.log('Hello');

contract("Hello", (accounts) => {
	describe("sayHello", async function() {
		it("should say [Hello,World!]", async function() {
            const hello = await Hello.new();

            const message = await hello.sayHello();
			message.should.be.equal("Hello,World!");
		});

        it("should say changed message", async function() {
            const hello = await Hello.new();

            await hello.changeHello("Hi!");

            const message = await hello.sayHello();
            message.should.be.equal("Hi!");
        });

        it("should say changed message", async function() {
            const hello = await Hello.new();

            await hello.changeHelloByLang("Korean","안녕!");

            const message = await hello.sayHelloByLang("Korean");
            message.should.be.equal("안녕!");
        });

    });
});

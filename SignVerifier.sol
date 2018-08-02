pragma solidity ^0.4.0;

contract SignVerifier {
    event Message(bytes32 r,bytes32 s,uint8 v, address signer);

    function testRecovery(bytes32 h, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
        if ( v < 27 ) v += 27;
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(prefix, h);
        address addr = ecrecover(prefixedHash, v, r, s);

        return addr;
    }

    function recoverAddr(bytes32 msgHash,bytes sig) public returns (address) {
        uint8 v; bytes32 r; bytes32 s;

       assembly {
         r := mload(add(sig, 32))
         s := mload(add(sig, 64))
         v := byte(0, mload(add(sig, 96)))
       }

        address signer = testRecovery(msgHash,v,r,s);
        emit Message(r,s,v, signer);

        return signer;
    }
}

/**
ar Example = artifacts.require('./Example.sol')

var Web3 = require('web3')
var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

contract('Example', (accounts) => {
  var address = accounts[0]

  it('ecrecover result matches address', async function() {
    var instance = await Example.deployed()
    var msg = '0x8CbaC5e4d803bE2A3A5cd3DbE7174504c6DD0c1C'

    console.log(web3.version);

    var h = web3.utils.sha3(msg) // var h = web3.sha3(msg)
    var sig = await web3.eth.sign(h,address); // var sig = await web3.eth.sign(address,h);
    var sig = sig.slice(2)
    var r = `0x${sig.slice(0, 64)}`
    var s = `0x${sig.slice(64, 128)}`
    var v = web3.utils.toDecimal(sig.slice(128, 130)); // var v = web3.toDecimal(sig.slice(128, 130));

    var result = await instance.testRecovery.call(h, v, r, s)
    assert.equal(result, address)
  })

  it('recoverAddr result matches address', async function() {
    var instance = await Example.deployed()
    var msg = '0x8CbaC5e4d803bE2A3A5cd3DbE7174504c6DD0c1C'

    console.log(web3.version);

    var h = web3.utils.sha3(msg) // var h = web3.sha3(msg)
    var sig = await web3.eth.sign(h,address); // var sig = await web3.eth.sign(address,h);

    var result = await instance.recoverAddr(h, sig,{from:address});
    console.log(result.tx, result.receipt);
    assert.equal(result, address)
  })
})
 */

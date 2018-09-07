"use strict";

var should = require('chai')
    .use(require('chai-as-promised'))
    .should();

const TestHelperKlass = function () {
}

TestHelperKlass.prototype = {

    awaitEvent: async function awaitEvent(event, handler) {
        return new Promise((resolve, reject) => {
            function wrapHandler(...args) {
                Promise.resolve(handler(...args)).then(resolve).catch(reject);
            }

            event.watch(wrapHandler);
        });
    },

    countEvent: async function countEvents(events) {
        return new Promise((resolve, reject) => {
            events.get(function (error, logs) {
                if (error)
                    reject(error);
                else
                    resolve(logs.length);
            })
        });
    },

    expectThrow: function expectThrow(transactionPromise) {
        transactionPromise.then(() => {
            should.fail(0, 1, 'This must not be run');
        })
            .catch((error) => {
                console.log('expectThrow = ',error.message);
                error.message.should.contain('revert');
            });
    }
}

module.exports = new TestHelperKlass();
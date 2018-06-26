var QuoteRegistry = artifacts.require('./QuoteRegistry.sol');

contract("QuoteRegistry-General", function() {
    // validate instance creation
    it("should create a new instance of QuoteRegistry core contract", function() {
        return QuoteRegistry.deployed().then(function(instance) {
            return instance.getQuote.call();
        }).then(function(result){
            assert.equal(result.length, 0, "Quote is not registered, should be null");
        });
    });

    it("should create a new instance of QuoteRegistry, add a new quote and return", function() {
        var _meta;

        return QuoteRegistry.deployed().then(function(instance){
            _meta = instance;
            return _meta.claimQuote("To be or not to be.");
        }).then(function(txResult){
            return _meta.getQuote.call();
        }).then(function(result){
            assert.equal(result, "To be or not to be.", "Quote should be set.");
        });
    });

    it("should create a new instance of QuoteRegistry, add a new quote, then transfer to another owner", function(){
        var _meta;
        var _initialQuoteValidation;
        var _destinationQuoteAddress = '0x1c8efd8a2fa962ffb4e518a4b6a806879b386254';

        return QuoteRegistry.deployed().then(function(instance){
            _meta = instance;
            return _meta.claimQuote("To be or not to be.");
        }).then(function(claimResult) {
            return _meta.getQuote.call();
        }).then(function(getQuoteResult){
            _initialQuoteValidation = getQuoteResult;
            return _meta.transferQuote(_destinationQuoteAddress, "To be or not to be.");
        }).then(function(transferTxResult){
            return _meta.getQuoteByAddress.call(_destinationQuoteAddress);
        }).then(function(transferResult){
            assert.equal(_initialQuoteValidation, "To be or not to be.", "Quote should be set to our address.");
            assert.equal(transferResult, "To be or not to be.", "Quote should be owned by new owner");
        });
    });
});
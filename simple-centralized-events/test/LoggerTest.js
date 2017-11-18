var Logger = artifacts.require("./contracts/Logger.sol");

var sampleAddress = '0xcf750718e014c4e245b81ba6dbf3a19602b5c998';

contract("Logger-General", function() {
    // validate Logger initialization
    it("should create a new instance of Logger with the caller as owner", function(){
        return Logger.deployed().then(function(instance){
            return instance.owner();
        }).then(function(result){
            assert(result.valueOf(), "The owner was not set.");
        });
    });

    // validate whitelisting of contract
    it("should add an address to the Logger for a contract", function(){
        var _meta;

        return Logger.deployed().then(function(instance){
            _meta = instance;
            return _meta.register(sampleAddress);
        }).then(function(txResult){
            return _meta.owner();
        }).then(function(ownerAddress){
            return _meta.checkAddress(sampleAddress);
        }).then(function(result){
            assert.equal(result.valueOf(), true, "The address of the sample address was not stored.");
        });
    });
});
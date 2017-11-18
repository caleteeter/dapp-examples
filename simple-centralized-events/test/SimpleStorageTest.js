var SimpleStorage = artifacts.require("./contracts/SimpleStorage.sol");

contract("SimpleStorage-General", function() {
    // validate Log event propogation
    it("should create a new _meta of SimpleStorage with the caller as owner", function(){
        var _meta;

        return SimpleStorage.deployed().then(function(instance){
            _meta = instance;
            return _meta.set(42);
        }).then(function(txResult){
            return _meta.get.call();
        }).then(function(result){
            assert.equal(result.valueOf(), 42, "The owner was not set.");
        });
    });
});
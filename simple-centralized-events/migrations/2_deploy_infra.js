var Logger = artifacts.require("Logger");
var SimpleStorage = artifacts.require("SimpleStorage");

module.exports = function(deployer) {
    deployer.deploy(Logger).then(function(){ return deployer.deploy(SimpleStorage, 7, Logger.address); });
};
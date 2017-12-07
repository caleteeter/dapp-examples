var Test = artifacts.require("./Test.sol");
var Utility = artifacts.require("./Utility.sol");

module.exports = function(deployer) {
    deployer.deploy(Utility);
    deployer.deploy(Test);
  };
var Ownable = artifacts.require('Ownable.sol');
var BankAccount = artifacts.require('BankAccount.sol');

module.exports = function(deployer){
    deployer.deploy(Ownable);
    deployer.deploy(BankAccount, 100000);
}
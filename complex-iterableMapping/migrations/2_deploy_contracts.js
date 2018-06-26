var QuoteRegistry = artifacts.require('./QuoteRegistry.sol')
var IterableMapping = artifacts.require('./IterableMapping.sol')

module.exports = function(deployer) {
    deployer.deploy(IterableMapping);
    deployer.link(IterableMapping, QuoteRegistry);
    deployer.deploy(QuoteRegistry);
}
var Main = artifacts.require('./contracts/Main.sol');

contract("Main-General", function(){
    it ("check gas prices for function call setter", function(){
        // check gas price
        Main.web3.eth.getGasPrice(function(err, res){
            var gasPrice = Number(res);
            console.log("Gas Price is " + gasPrice + " wei");

            // get contract instance
            Main.deployed().then(function(instance){
                return instance.setDerivedData.estimateGas(42);
            }).then(function(result){
                var gas = Number(result);
                console.log("Gas estimation = " + gas + " units");
                console.log("Gas cost estimation = " + (gas * gasPrice)+ " wei");
                console.log("Gas cost estimation = " + Main.web3.fromWei((gas * gasPrice), 'ether') + " ether");
            });
        });
    })
});
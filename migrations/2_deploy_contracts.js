var ManoCoinCrowdsale = artifacts.require('./ManoCoinCrowdsale.sol');
var ManoCoin = artifacts.require('./ManoCoin.sol');

module.exports = function(deployer, network, accounts) {
   
    const rate = new web3.BigNumber(1000);
    const wallet = accounts[1];
    const cap = 2000000000.00;

    return deployer 
        .then(() => {
            return deployer.deploy(ManoCoin);
        })

        .then (() => {
            return deployer.deploy(
                ManoCoinCrowdsale,
                rate,
                wallet,
                ManoCoin.address
            );
        });
}
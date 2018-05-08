
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
 var HDWalletProvider = require("truffle-hdwallet-provider");
 var mnemonic = "orange apple banana ";
 module.exports = {
    networks: {
      development: {
        provider: new HDWalletProvider(mnemonic, "https://kovan.infura.io/RqyGxlhDAe3zgif9Re1B np"),
        network_id: '*',
      }
    }
  };
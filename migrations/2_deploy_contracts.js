const CoinToss = artifacts.require("CoinToss");

module.exports = function(deployer) {
  await deployer.deploy(CoinToss);
};

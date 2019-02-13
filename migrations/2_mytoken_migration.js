var MyToken = artifacts.require("./mytoken.sol");

module.exports = function(deployer) {
  deployer.deploy(MyToken);
};

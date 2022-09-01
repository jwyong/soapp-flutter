const Xcoin = artifacts.require("Xcoin");

module.exports = function (deployer) {
    deployer.deploy(Xcoin);
};

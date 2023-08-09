import "./VendingMachine.sol";

const VendingMachines = artifacts.require("VendingMachine");

module.exports = function (deployer){
    deployer.deploy(VendingMachines);
};
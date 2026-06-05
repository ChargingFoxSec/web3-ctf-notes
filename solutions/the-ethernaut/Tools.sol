// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Tools{
    function abiEncode() public pure returns (bytes memory) {
        return abi.encodeWithSignature("pwn()");
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MagicNumberAttacker {
    function deploy() external returns (address addr) {
        // Runtime bytecode: returns 42
        bytes memory bytecode = hex"602a60005260206000f3";

        assembly {
            addr := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        require(addr != address(0), "Deploy failed");
        return addr;
    }
}
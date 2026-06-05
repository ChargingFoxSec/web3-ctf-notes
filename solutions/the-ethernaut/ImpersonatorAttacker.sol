// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImpersonatorAttacker{
    function CalculateOtherSignture(bytes32 s) external pure returns(bytes32){
        return bytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - uint256(s));
    }
}
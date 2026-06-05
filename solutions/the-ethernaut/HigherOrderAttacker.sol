// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HigherOrderAttacker{
    address higherOrder;
    constructor(address _higherOrder) {
        higherOrder = _higherOrder;
    }

    function attack(bytes memory _calldata) external returns(bool){
        (bool success,)= address(higherOrder).call(_calldata);
        return success;
    }
}
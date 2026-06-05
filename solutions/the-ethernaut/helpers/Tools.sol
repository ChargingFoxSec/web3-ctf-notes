// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Tools {
    function functionEncode(string memory signature, uint target) external pure returns (bytes memory) {
        return abi.encodeWithSignature(signature, target);
    }

    function castAddressToUint256(address addr) external pure returns (uint256){
        return uint256(uint160(addr));
    } 

    function castUint256ToAddress(uint256 addr) external pure returns (address){
        return address(uint160(addr));
    } 
    function encodeMulticall(bytes[] memory calls) public pure returns (bytes memory) {
        return abi.encodeWithSignature("multicall(bytes[])", calls);
    }

    function encodeDeposit() public pure returns (bytes memory) {
        return abi.encodeWithSignature("kill()");
    }
    
    function magicAnimalTool() public pure returns(string memory){
         string memory exploitString = string(abi.encodePacked(hex"10000000000000000000FFFF"));
         return exploitString;
    }
}
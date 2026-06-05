// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}

contract DoubleEntryPointDetectionBot is IDetectionBot{
    function handleTransaction(address user, bytes calldata msgData) external{
        address origSender;
        assembly {
            origSender := calldataload(0xa8)
        }
            // raise alert only if the msg.sender is CryptoVault contract
        if (origSender == 0xAD60831520Ee024a907631B6D42e871FB53C9508) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}
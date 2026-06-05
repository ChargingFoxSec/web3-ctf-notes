// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract PreservationLibraryContract {
    // stores a timestamp
    uint256 storedTime;

    function setTime(uint256 _time) public {
        storedTime = _time;
    }
}
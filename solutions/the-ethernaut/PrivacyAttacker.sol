// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract PrivacyAttacker{
    bool public locked = true;
    uint256 public ID = 1747189884;

    bytes32 slot5 = 0x23bcbeb39e045860a62d9b3d433849660dc906c85d4dcc85e485cd0a0f72b06c;

    function casting() external view returns (bytes16){
        return bytes16(slot5);
    }

    function unlock(bytes16 _key) public {
        require(_key == bytes16(slot5));
        locked = false;
    }

    function castingId() external view returns(uint16){
        return uint16(ID);
    }
}
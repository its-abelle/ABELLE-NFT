//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {AbelleNFT} from "../src/AbelleNFT.sol";
import {Test} from "forge-std/Test.sol";
import {DeployAbelleNFT} from "../script/DeployAbelleNFT.s.sol";

contract testAbelleNFT is Test {
    DeployAbelleNFT public deployer;
    AbelleNFT public abelleNft;
    address USER = makeAddr("USER");
    string public constant METADATA =
        "ipfs://bafybeie2sb46rhfv4lpba6zirjinig6ckacmbvfcrq26lbv7jojvkfedjm.ipfs.dweb.link?filename=metadata.json";

    function setUp() public {
        deployer = new DeployAbelleNFT();
        abelleNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "ABELLE";
        string memory actualName = abelleNft.name();
        assertEq(keccak256(abi.encodePacked(expectedName)), keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintNFTAndHaveBalance() public {
        vm.prank(USER);
        abelleNft.mintNft(METADATA);

        assertEq(abelleNft.balanceOf(USER), 1);
        assert(keccak256(abi.encodePacked(abelleNft.tokenURI(0))) == keccak256(abi.encodePacked(METADATA)));
    }
}

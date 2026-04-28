//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {AbelleNFT} from "../src/AbelleNFT.sol";
import {Script} from "forge-std/Script.sol";

contract DeployAbelleNFT is Script {
    function run() external returns (AbelleNFT) {
        vm.startBroadcast();
        AbelleNFT abelleNft = new AbelleNFT();
        vm.stopBroadcast();
        return abelleNft;
    }
}

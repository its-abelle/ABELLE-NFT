//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AbelleNFT} from "../src/AbelleNFT.sol";
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/DevOpsTools.sol";

contract MintAbelleNFT is Script {
    string public constant METADATA =
        "ipfs://bafybeie2sb46rhfv4lpba6zirjinig6ckacmbvfcrq26lbv7jojvkfedjm.ipfs.dweb.link?filename=metadata.json";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("AbelleNFT", block.chainid);

        mintNft(mostRecentlyDeployed);
    }

    function mintNft(address _contract) public {
        vm.startBroadcast();
        AbelleNFT(_contract).mintNft(METADATA);
        vm.stopBroadcast();
    }
}

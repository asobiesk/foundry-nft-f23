//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DevOpsTools} from "@foundry-devops/DevOpsTools.sol";

contract MintBasicNft is Script {
    string public constant CUSTOM_PUG_URI =
        "ipfs://QmbZ9bJxVAfaLzzC1P7FYYLFBi3xR7TRjjgJp84n6ZUsRi";

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(CUSTOM_PUG_URI);
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }
}

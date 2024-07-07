// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    string public constant HORIZON =
        "https://ipfs.io/ipfs/QmawH6qD9AcHfVGRM6RnmPkKK3QDMZsrEqZYHzLHHytp7x?filename=DALL%C2%B7E%202024-01-15%2023.09.13%20-%20Create%20an%20image%20of%20an%20animated%20male%20character%20in%20a%20Japanese%20manga%20style%20that%20conveys%20hopefulness%20and%20aspiration.%20The%20character%20should%20have%20large%2C%20expr.png";

    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(HORIZON);
        vm.stopBroadcast();
    }
}

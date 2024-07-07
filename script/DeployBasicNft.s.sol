// SPDX: License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract DeployBasicNft is Script {
    function run() external returns (BasicNft) {
        vm.startBroadcast();
        BasicNft basicNft = new BasicNft(); // we initialize a new instance of basicNft so we can use basicNfts functions.
        vm.stopBroadcast();
        return basicNft;
    }
}

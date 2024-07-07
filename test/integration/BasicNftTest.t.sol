// SPDX: License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer; // we initialize a new instance of DeployBasicNft so we can use DeployBasicNft functions.
    BasicNft public basicNft; // we initialize a new instance of BasicNft so we can use BasicNft functions.
    address public USER = makeAddr("user"); // we initialize a new address for the user.
    string public constant HORIZON =
        "https://ipfs.io/ipfs/QmawH6qD9AcHfVGRM6RnmPkKK3QDMZsrEqZYHzLHHytp7x?filename=DALL%C2%B7E%202024-01-15%2023.09.13%20-%20Create%20an%20image%20of%20an%20animated%20male%20character%20in%20a%20Japanese%20manga%20style%20that%20conveys%20hopefulness%20and%20aspiration.%20The%20character%20should%20have%20large%2C%20expr.png"; // our ipfs address linked to an image for byte size to test.

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameisCorrect() public view {
        string memory expectedName = "horizon";
        string memory actualName = basicNft.name(); //this is a getter function located in ERC721
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(HORIZON); // we are indicating that a user is minting a new NfT taking in this tokenuri, we should then expect the user has 1 nft balance, and that the uri of the nft is the same as the tokenURI that is returning our mapping address.

        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(HORIZON)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}

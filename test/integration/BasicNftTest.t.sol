//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../../src/BasicNft.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    string public constant CUSTOM_PUG_URI =
        "ipfs://QmbZ9bJxVAfaLzzC1P7FYYLFBi3xR7TRjjgJp84n6ZUsRi";
    BasicNft basicNft;
    address public USER = makeAddr("USER");

    function setUp() external {
        DeployBasicNft deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testBasicNftHasCorrectNameAndSymbol() public {
        assertEq(basicNft.name(), "Dogie");
        assertEq(basicNft.symbol(), "DOG");
    }

    function testBasicNftCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(CUSTOM_PUG_URI);
        assert(basicNft.balanceOf(USER) == 1);
        assertEq(basicNft.tokenURI(0), CUSTOM_PUG_URI);
    }
}

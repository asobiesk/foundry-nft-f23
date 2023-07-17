//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {MoodNft} from "../../src/MoodNft.sol";

contract MoodNftIntegrationTest is Test {
    MoodNft moodNft;
    address USER = makeAddr("USER");
    string public constant HAPPY_SVG_URI =
        "data:application/json;base64,eyJuYW1lIjoiTW9vZCBORlQiLCAiZGVzY3JpcHRpb24iOiJBbiBORlQgdGhhdCByZWZsZWN0cyB0aGUgb3duZXJzIG1vb2QhIiwgImF0dHJpYnV0ZXMiOiBbeyJ0cmFpdF90eXBlIjogIm1vb2RpbmVzcyIsICJ2YWx1ZSI6IDEwMH1dLCAiaW1hZ2UiOiAiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxQSE4yWnlCMmFXVjNRbTk0UFNJd0lEQWdNakF3SURJd01DSWdkMmxrZEdnOUlqUXdNQ0lnSUdobGFXZG9kRDBpTkRBd0lpQjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaVBnb2dJRHhqYVhKamJHVWdZM2c5SWpFd01DSWdZM2s5SWpFd01DSWdabWxzYkQwaWVXVnNiRzkzSWlCeVBTSTNPQ0lnYzNSeWIydGxQU0ppYkdGamF5SWdjM1J5YjJ0bExYZHBaSFJvUFNJeklpOCtDaUFnUEdjZ1kyeGhjM005SW1WNVpYTWlQZ29nSUNBZ1BHTnBjbU5zWlNCamVEMGlOakVpSUdONVBTSTRNaUlnY2owaU1qRWlJR1pwYkd3OUluSmxaQ0l2UGdvZ0lDQWdQR05wY21Oc1pTQmplRDBpTVRJM0lpQmplVDBpT0RJaUlISTlJamdpTHo0S0lDQThMMmMrQ2lBZ1BIQmhkR2dnWkQwaWJURXpOaTQ0TVNBeE1UWXVOVE5qTGpZNUlESTJMakUzTFRZMExqRXhJRFF5TFRneExqVXlMUzQzTXlJZ2MzUjViR1U5SW1acGJHdzZibTl1WlRzZ2MzUnliMnRsT2lCaWJHRmphenNnYzNSeWIydGxMWGRwWkhSb09pQXpPeUl2UGdvOEwzTjJaejRLIn0=";

    function setUp() external {
        DeployMoodNft deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testViewTokenURIIntegration() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }

    function testFlipTokenToHappyFlipsCorrectly() public {
        vm.prank(USER);
        moodNft.mintNft();
        vm.prank(USER);
        moodNft.flipMood(0);
        console.log(moodNft.tokenURI(0));
        assertEq(moodNft.tokenURI(0), HAPPY_SVG_URI);
    }
}

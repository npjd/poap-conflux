// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import "../src/POAP.sol";

contract POAPTest is Test {
    POAP POAPContract;

    function setUp() public {
        console.log("setUp");
        address[] memory t = new address[](1);
        t[0] = msg.sender;
        POAPContract = new POAP("POAP", "POAP", t);
    }

    function test_safeMint() public {
        console.log("test_safeMint");
        POAPContract.safeMint(msg.sender);
    }
}

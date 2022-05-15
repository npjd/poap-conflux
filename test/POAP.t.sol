// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "../src/POAP.sol";
import "forge-std/console.sol";

contract POAPTest is Test {
    POAP POAPContract;

    function setUp() public {
        console.log("setUp");
        address[] memory t = new address[](1);
        t[0] = msg.sender;
        POAPContract = new POAP("POAP", "POAP", "uri", t);
    }

    function test_safeMint() public {
        assertEq("POAP", POAPContract.name());
        POAPContract.safeMint(msg.sender);
        assertEq(1, POAPContract.balanceOf(msg.sender));
        vm.expectRevert();
        // why is this not catching the revert?
        POAPContract.safeMint(msg.sender);
    }
}

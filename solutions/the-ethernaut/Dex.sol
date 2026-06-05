// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 以 OpenZeppelin 0.8.x 为例
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.3/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.3/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.3/contracts/access/Ownable.sol";

contract Dex is Ownable {
    address public token1;
    address public token2;

    constructor() {}

    function setTokens(address _token1, address _token2) public onlyOwner {
        token1 = _token1;
        token2 = _token2;
    }
    //q 增加流动性？
    function addLiquidity(address token_address, uint256 amount) public onlyOwner {
        //发起者转账amount数量的token到本合约
        IERC20(token_address).transferFrom(msg.sender, address(this), amount);
    }
    //token1和token2 互换
    function swap(address from, address to, uint256 amount) public {
        require((from == token1 && to == token2) || (from == token2 && to == token1), "Invalid tokens");
        require(IERC20(from).balanceOf(msg.sender) >= amount, "Not enough to swap");
        uint256 swapAmount = getSwapPrice(from, to, amount);
        //把发起者的from Token 转到这个合约
        IERC20(from).transferFrom(msg.sender, address(this), amount);
        //这个合约申请转账额度
        IERC20(to).approve(address(this), swapAmount);
        //这个合约再转相应数额的to Token给发起者
        IERC20(to).transferFrom(address(this), msg.sender, swapAmount);
    }
    //汇率函数
    //q fromToken如果为0 那就直接报错?
    function getSwapPrice(address from, address to, uint256 amount) public view returns (uint256) {
        //数量*本合约的toToken数量/本合约的fromToken
        //兑换价格波动受这个合约token余额的影响
        return ((amount * IERC20(to).balanceOf(address(this))) / IERC20(from).balanceOf(address(this)));
    }
    //申请额度
    function approve(address spender, uint256 amount) public {
        SwappableToken(token1).approve(msg.sender, spender, amount);
        SwappableToken(token2).approve(msg.sender, spender, amount);
    }

    function balanceOf(address token, address account) public view returns (uint256) {
        return IERC20(token).balanceOf(account);
    }
}

contract SwappableToken is ERC20 {
    address private _dex;

    constructor(address dexInstance, string memory name, string memory symbol, uint256 initialSupply)
        ERC20(name, symbol)
    {
        _mint(msg.sender, initialSupply);
        _dex = dexInstance;
    }

    function approve(address owner, address spender, uint256 amount) public {
        require(owner != _dex, "InvalidApprover");
        super._approve(owner, spender, amount);
    }
}
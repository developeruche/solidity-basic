// SPDX-License-Identifier: MIT
/* 
This contract is one i would call a mutual swap, this contract stands as a middle man fo two user to swap token assets

 */
pragma solidity >=0.5.0 <0.9.0;


interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}


contract TokenSwap {
    IERC20 public token1;
    address public owner1;
    IERC20 public token2;
    address public owner2;

    constructor (
        address _token1,
        address _owner1,
        address _token2,
        address _owner2
    ) public {
        token1 = IERC20(_token1);
        owner1 = _owner1;
        token2 = IERC20(_token2);
        owner2 = _owner2;
    }

    function swap(uint _amount1, uint _amount2) public {
        require(msg.sender == owner1 || msg.sender == owner2);
        require(token1.allowance(owner1, address(this)) >= _amount1, "Token 1 allowance is too low.");
        require(token2.allowance(owner2, address(this)) >= _amount2, "Token 2 allowance too low.");

        // Now transfering the tokens
        // token1, owner1, amount1 to owner2
        _safeTranferFrom(token1, owner1, owner2, _amount1);
        _safeTranferFrom(token2, owner2, owner1,  _amount2);

    }

    function _safeTranferFrom(
        IERC20 token, 
        address sender,
        address recipient,
        uint amount
    ) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token tranfer was not successfull, REVERTING...");
    }
}
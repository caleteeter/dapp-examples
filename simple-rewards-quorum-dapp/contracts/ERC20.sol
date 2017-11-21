pragma solidity ^0.4.17;

import "./ERC20Base.sol";

contract ERC20 is ERC20Base {

    event Approval(address indexed owner, address indexed spender, uint256 value);

    function allowance(address owner, address spender) public constant returns (uint256);

    function tranferFrom(address from, address to, uint256 value) public returns (bool);

    function approve(address spender, uint256 value) public returns (bool);
}
pragma solidity ^0.4.17;

contract ERC20Base {
    uint256 public totalSupply;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function balanceOf(address who) public constant returns (uint256);

    function transfer(address to, uint256 value) public returns (bool);
}
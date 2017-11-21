pragma solidity ^0.4.17;

import "./Ownable.sol";

contract BankAccount is Ownable {

    uint256 public balance;

    event PaymentProcessed();
    
    function BankAccount(uint256 amount) public {
        balance = amount;
    }

    function pay(uint256 amount) public {
        if (amount <= balance) {
            balance -= amount; 
            PaymentProcessed();
        }
    }
}
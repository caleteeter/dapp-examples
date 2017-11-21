pragma solidity ^0.4.17;

import "./SafeMath.sol";

contract PullPayment {
    using SafeMath for uint256;

    mapping(address => uint256) public payments;
    uint256 public totalPayments;

    function asyncSend(address dest, uint256 amount) internal {
        payments[dest] = payments[dest].add(amount);
        totalPayments = totalPayments.add(amount);
    }

    function withdrawPayments() public {
        address payee = msg.sender;
        uint256 payment = payments[payee];

        require(payment != 0);
        require(this.balance >= payment);

        totalPayments = totalPayments.sub(payment);
        payments[payee] = 0;

        assert(payee.send(payment));
    }
}
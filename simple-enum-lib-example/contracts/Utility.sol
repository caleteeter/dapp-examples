pragma solidity ^0.4.17;

contract Utility {
    enum State { Created, Locked, Inactive } 
    uint public test;
    State stateEnum;

    function Utility() public {
        test = 7;
        stateEnum = State.Inactive;
    }
}
pragma solidity ^0.4.17;

import './Utility.sol';

contract Test is Utility {

    Utility testEnum;

    function Test() public {
        
    }

    function getTestState() public constant returns (State) {
        return stateEnum;
    }

    function createTestState() public returns (State) {
        stateEnum = State.Created;
        return stateEnum;
    }

    function lockTestState() public returns (State) {
        stateEnum = State.Locked;
        return stateEnum;
    }
}
pragma solidity ^0.4.11;

import "./Logger.sol";

contract SimpleStorage {
    uint storedData;
    Logger public logger;
    address public myAddress;

    function SimpleStorage(uint initVal, address logContract) public {
        storedData = initVal;
        logger = Logger(logContract);
        myAddress = address(this);
    }

    function getMyAddress() constant public returns (address) {
        return myAddress;
    }

    function get() constant public returns (uint) {
        return storedData;
    }

    function set(uint newVal) public {
        storedData = (newVal);
        logger.logRegistered();
    }

    function registerLog(address a) public {
        logger.register(a);
    }
}
pragma solidity ^0.4.17;

contract Logger {
    mapping(address => bool) public whitelist;
    address public owner;

    event LogInfo(address _id);

    modifier whitelisted {
        require(whitelist[msg.sender]);
        _;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function checkAddress(address chkAddress) constant public returns (bool) {
        return whitelist[chkAddress];
    }

    function Logger() public {
        owner = msg.sender;
    }

    function register(address a) public {
        whitelist[a] = true;
    }

    function logRegistered() public {
        LogInfo(owner);
    }
}
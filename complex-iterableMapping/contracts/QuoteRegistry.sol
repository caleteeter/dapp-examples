pragma solidity ^0.4.23;

import "./IterableMapping.sol";

contract QuoteRegistry {

    IterableMapping.itmap data;

    function claimQuote(string quote) public returns (uint) {
        if (!checkQuoteClaimed(quote)) {
            return IterableMapping.insert(data, msg.sender, quote);
        }
        return 0;
    }

    function getQuote() public view returns (string quote) {
        return IterableMapping.get(data, msg.sender);
    }

    function getQuoteByAddress(address owner) public view returns (string quote) {
        return IterableMapping.get(data, owner);
    }

    function checkQuoteClaimed(string quote) public view returns (bool) {
        return IterableMapping.containsValue(data, quote);
    }
    
    function transferQuote(address newOwner, string quote) public {
        IterableMapping.remove(data, msg.sender);
        IterableMapping.insert(data, newOwner, quote);
    }
}

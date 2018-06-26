pragma solidity ^0.4.23;

library IterableMapping {
    struct itmap {
        address[] indexes;
        mapping(address => IndexValue) data;
        mapping(address => bool) indexStates;
    }

    struct IndexValue {
        uint keyIndex;
        string value;
    }

    function insert(itmap storage self, address key, string value) public returns (uint keyIndex) {
        uint newKeyIndex = self.indexes.length++;
        self.indexes[newKeyIndex] = key;
        self.data[key].keyIndex = newKeyIndex;
        self.data[key].value = value;
        return newKeyIndex;
    }

    function remove(itmap storage self, address key) public returns (bool success) {
        delete self.data[key];
        self.indexStates[key] = true;
        return true;
    }

    function get(itmap storage self, address key) public view returns (string) {
        if (!self.indexStates[key]) {
            return self.data[key].value;
        }
    }

    function containsValue(itmap storage self, string quote) public view returns (bool) {
        for(uint i = 0; i < self.indexes.length; i++) {
            if (!self.indexStates[self.indexes[i]]) {
                if (keccak256(self.data[self.indexes[i]].value) == keccak256(quote)) {
                    return true;
                }
            }
        }
        return false;
    }
}
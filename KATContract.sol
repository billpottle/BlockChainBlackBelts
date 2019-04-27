pragma solidity ^0.4.17;

contract KATBlackBelts {
    string hash;
    address owner;
    mapping(uint => Record) BBRecords;

    struct Record {
        uint bbNum;
        string bbDate;
        string bbName;
    }
        
    function KATBlackBelts() public {
        hash = "1234";
        owner = msg.sender;
    }

    modifier onlyowner() {
        if (msg.sender == owner) {
            _;
        }
    }
    
    
    function setRecord(uint newbbNum, string newbbDate, string newbbName) onlyowner public {
        BBRecords[newbbNum].bbDate = newbbDate;
        BBRecords[newbbNum].bbName = newbbName;
    }

    function getRecordName(uint currentBBNum) public constant returns (string) {
        return BBRecords[currentBBNum].bbName;
    }

    function getRecordDate(uint currentBBNum) public constant returns (string) {
        return BBRecords[currentBBNum].bbDate;
    }


    function setHash(string hashToSet) public onlyowner returns (string) {
        hash = hashToSet;
    }
    
    function getHash() public constant returns (string) {
        return hash;
    }

    function kill() public {
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }
}
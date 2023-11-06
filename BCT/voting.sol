// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // Define the structure for a candidate.
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // State variables
    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public voters;

    uint256 public candidatesCount;

    // Contract owner
    address public owner;

    // Events
    event Voted(uint256 indexed candidateId);

    constructor() {
        owner = msg.sender;
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    function addCandidate(string memory _name) public onlyOwner {
        candidates[candidatesCount] = Candidate({
            name: _name,
            voteCount: 0
        });
        candidatesCount++;
    }

    function vote(uint256 _candidateId) public {
        require(!voters[msg.sender], "You have already voted");
        require(_candidateId >= 0 && _candidateId < candidatesCount, "Invalid candidate ID");

        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;

        emit Voted(_candidateId);
    }
}

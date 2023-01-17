// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Ownable.sol";

contract Election is Owner {

    //model of a candidate
    struct Candidate {
        uint id;
        string name;
        string party;
        uint voteCount;
    }

    //store candidate countss
    mapping(uint => Candidate) public candidates;

    //store accounts that have voted
    mapping(address => bool) public hasVoted;

    //count the number of candidates
    uint public candidatesCount;

    event Voted(uint indexed _candidateId);
 
    //constructor
    constructor() {
        addCandidate("Jean Mark", "Ecology");
        addCandidate("Anne Sophie","Liberal");
    }
    
    //only the owner can add a candidate
    function addCandidate(string memory _name, string memory _party) public onlyOwner {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, _party, 0);
    }
    
    //anyone that hasn't voted can vote
    function vote(uint _candidateId) public {
        require(!hasVoted[msg.sender]);
        require(_candidateId < candidatesCount && _candidateId > 0);
        candidates[_candidateId].voteCount++;
        emit Voted(_candidateId);
    }

}

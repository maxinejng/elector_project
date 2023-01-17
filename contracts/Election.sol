// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Election {

    //model of a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //store candidate
    mapping(uint => Candidate) public candidates;

    //count 
    uint public candidateCount;
 
    //constructor
    constructor() {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }
}
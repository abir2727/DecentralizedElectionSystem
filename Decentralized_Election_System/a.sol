pragma solidity ^0.4.17;

contract DecentralizedElectionSystem {

    uint public candidateCount = 0;

    mapping(uint => Candidate) public candidates;

    struct Candidate {
        uint _id;
        string _name;
        uint candidateVotes;
    }

    mapping(address => uint) public status;

    function addCandidate(string memory _name) private {
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
        candidateCount += 1;
    }

    constructor() public {
        addCandidate("Ameer Talha");
        addCandidate("Monjure Mowla Abir");
        addCandidate("Nipun Paul");
        addCandidate("Mutakabbirul Islam Pranto");
    }

    function castVote(uint index) public payable {
        require(status[msg.sender] == 0, "You have already voted!!");
        Candidate storage candidate = candidates[index];
        candidate.candidateVotes++;
        status[msg.sender] = 1;
    }

    function showCount(uint _id) view public returns (uint) {
        return candidates[_id].candidateVotes;
    }

    function showStatus(address _address) view public returns (uint) {
        return status[_address];
    }

}
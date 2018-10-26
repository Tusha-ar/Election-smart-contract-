pragma solidity ^0.4.0;

contract election
{
    struct info
    {
        uint id;
        string name;
        uint voteCount;
    }
    mapping(address=>bool) public voters;
    mapping(uint=> info) public Candidates;
    uint candidates_count;
    function election()public
    {
        addCandidate("Candidate1");
        addCandidate("Candidate2");
    }
    function addCandidate(string _candidate) private
    {
        candidates_count++;
        Candidates[candidates_count]=info(candidates_count,_candidate,0);
    }
    function vote(uint _id) public{
        require(!voters[msg.sender]);
        require(_id>0 && _id<=candidates_count);
        Candidates[candidates_count].voteCount++;
        voters[msg.sender]=true;

    }
}

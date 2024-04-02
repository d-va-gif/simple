// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Election{
     address public owner;

     struct Candidate{
        string name;
        uint voteCount;
     }

     
     Candidate[] public candidate;
     //keeps record of all the candidates

     constructor(){
        owner = msg.sender;
     }
     function addCandidate(string memory _name, uint _voteCount) public{
        require(owner == msg.sender, "Not owner");
         candidate.push(Candidate(_name, _voteCount));
     }

     function vote(uint id) public{ 
        candidate[id].voteCount ++;
     }
     function getVote(uint id) public view returns(uint){
         require(id < candidate.length, "Invalid id");
         return candidate[id].voteCount;
     }

}
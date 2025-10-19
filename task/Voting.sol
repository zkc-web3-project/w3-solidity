
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Voting{

    //候选人得票
    mapping(address => uint) public votes;
    
    //候选人辅助数组，方便遍历
    address[] public voteArr; 

    //投票给某个候选人
    function vote(address candidate) public {
        votes[candidate]++;
        voteArr.push(candidate);
    }
    //获取某个候选人的得票数
    function getVotes(address candidate) public view returns(uint){
        return votes[candidate];
    }
    //重置所有候选人的得票数
    function resetVotes() public {
        //循环voteArr并重置votes
        for(uint i = 0;i<voteArr.length;i++){
            votes[voteArr[i]] = 0;
        }
    }

}
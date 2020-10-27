pragma solidity 0.7.0;
// SPDX-License-Identifier: UNLICENSED

contract CoinToss {
    uint public betChoice = 0;
    uint public outcome;

    event BetOutcome(address userAddress, uint amount, bool winOrLose);

    function setBet(uint _setBet) external payable {
        require(msg.value == 1 ether || msg.value > 1 ether, "please send minimum 1 ether to play");
        require(_setBet == 1 || _setBet == 2, "please choose either 1 or 2");
        betChoice = _setBet;
        outcome = 0;
    }


    function tossCoin() external payable {
        require(address(this).balance == 1 ether || address(this).balance > 1 ether , "you must select 0 or 1 prior to tossing");
        require(betChoice == 1 || betChoice == 2,  "send minimum 1 ether to choice between 1 or 2");

        uint _outcome = block.timestamp % 2;

        if(_outcome == betChoice) {
            msg.sender.transfer(msg.value*2);
            betChoice = 0;
            outcome = _outcome;
            emit BetOutcome(msg.sender, msg.value, true);
        }

        else {
            betChoice = 0;
            outcome = _outcome;
            emit BetOutcome(msg.sender, msg.value, false);
        }
    }

}

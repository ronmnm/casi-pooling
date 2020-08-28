pragma solidity ^0.6.0;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";
import "https://github.com/nucypher/nucypher/blob/main/nucypher/blockchain/eth/sol/source/contracts/staking_contracts/AbstractStakingContract.sol";


contract CasiPoolingContract is AbstractStakingContract, Ownable {

  uint public totalEthPaidByWorker;
  uint public totanNuInEscrow;

  struct casiParticipantInfo {
    uint nuInDeposit;
    uint nuWithdrawed;
    uint transactionCostPaid;
  }

  mapping(address => casiParticipantInfo) public casiParticipants;
  
  constructor(){}
  
  /**
  Here the contract gets tokens and immidiatelly sends to escrow
   */
  fallback () public {
      totanNuInEscrow += msg.amount;
      // send Nu tokens to escrow
  }
  
  /**
    Return availiable NU amaount for _participant
   */
  function checkAvailiableReward(address _participant) public view returns (uint) {
    
  }

  /**
    Return the amount in Wei to pay to compensate txn costs
   */
  function checkTransationCostToPay(address _participant) public view returns (uint) {
    // return amount;
  }


  /**
    Each participant can withdraw availiable NU from the contract
   */
  function withdrawTokens(uint _amount) public {
    require(checkTransationCostToPay(msg.sender) == 0, "Before withdraw NU please pay the transaction costs paid by worker");
    uint amountToSend = checkAvailiableReward(msg.sender);
    // ...
  }

}
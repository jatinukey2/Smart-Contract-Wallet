//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract Consumer {
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {}
}

contract SmartContractWallet {

    address payable public owner;
    mapping(address => uint) public allowance;
    mapping(address => bool) public IsAllowedToSend;

    mapping(address => bool) public guardians;
    address payable nextOwner;
    mapping(address => mapping(address => bool)) public nextOwnerGuardianVotedBool;
    uint guardiansResetCount;
    uint public constant confirmationsFromGuardiansForReset = 3;

    constructor() {
        owner = payable(msg.sender);
    }

    function setGuardian(address guardian, bool isGuardian) public {
        require(msg.sender == owner, "You are not the owner, aborting!");
        guardians[guardian] = isGuardian;
    }

    function proposeNewOwner(address payable newOwner) public {
        require(guardians[msg.sender], "You are not the guardian of the wallet, go away");
        require(nextOwnerGuardianVotedBool[newOwner][msg.sender] == false, "You already voted, aborting!");
        if(newOwner != nextOwner) {
            nextOwner = newOwner;
            guardiansResetCount = 0;
        }

        if(guardiansResetCount >= confirmationsFromGuardiansForReset) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _for, uint amount) public {
        require(msg.sender == owner, "You are not the owner, aborting!");
        allowance[_for] = amount;
        
        if(amount>0) {
            IsAllowedToSend[_for] = true;
        }
        else{
            IsAllowedToSend[_for] = false;
        }
    }

    function transfer(address to, uint amount, bytes memory payload) public returns(bytes memory) {
        if(msg.sender != owner){
            require(IsAllowedToSend[msg.sender],"You are not allowed to send anything from the smart contract, aborting!");
            require(allowance[msg.sender] >= amount,"You are sending more than you are allowed, aborting!");
            allowance[msg.sender] -= amount;

        }
        (bool success, bytes memory returnData) = to.call{value: amount}(payload);
        require(success, "Aborting! , the call was not successful");
        return returnData;
    }
    receive() external payable {}


}
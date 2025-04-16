// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    // Declare a public variable 'owner' of type address
    address public owner;

    // Create a mapping 'balances' that maps address to uint
    mapping(address => uint) public balances;

    // Modifier to allow only owner to access certain functions
    modifier onlyOwner() {
        // Require that msg.sender is the owner
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // Constructor that sets the msg.sender as owner
    constructor() {
        owner = msg.sender;
    }

    // Function to deposit ether into the contract
    function deposit() public payable {
        // Increment the sender's balance with msg.value
        balances[msg.sender] += msg.value;
    }

    // Function to check balance
    function getBalance() public view returns (uint) {
        // Return the balance of the sender
        return balances[msg.sender];
    }

    // Function to withdraw amount
    function withdraw(uint amount) public {
        // Check if sender has enough balance
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Deduct the amount from sender's balance
        balances[msg.sender] -= amount;

        // Transfer the amount to sender
        payable(msg.sender).transfer(amount);
    }

    // Owner-only function to check contract's total balance
    function contractBalance() public view onlyOwner returns (uint) {
        // Return address(this).balance
        return address(this).balance;
    }

    // Fallback function to receive ether
    receive() external payable {
        deposit();
    }
}

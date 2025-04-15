// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    // TODO: Declare a public variable 'owner' of type address
    address public ____;

    // TODO: Create a mapping 'balances' that maps address to uint
    mapping(address => ____) public ____;

    // Modifier to allow only owner to access certain functions
    modifier onlyOwner() {
        // TODO: Require that msg.sender is the owner
        require(msg.sender == ____, "Not the owner");
        _;
    }

    // TODO: Create a constructor that sets the msg.sender as owner
    constructor() {
        ____ = msg.sender;
    }

    // Function to deposit ether into the contract
    function deposit() public payable {
        // TODO: Increment the sender's balance with msg.value
        ____[msg.sender] += ____;
    }

    // Function to check balance
    function getBalance() public view returns (uint) {
        // TODO: Return the balance of the sender
        return ____[msg.sender];
    }

    // Function to withdraw amount
    function withdraw(uint amount) public {
        // TODO: Check if sender has enough balance
        require(____[msg.sender] >= amount, "Insufficient balance");

        // TODO: Deduct the amount from sender's balance
        ____[msg.sender] -= amount;

        // TODO: Transfer the amount to sender
        payable(msg.sender).transfer(____);
    }

    // Owner-only function to check contract's total balance
    function contractBalance() public view onlyOwner returns (uint) {
        // TODO: Return address(this).balance
        return ____;
    }

    // Fallback function to receive ether
    receive() external payable {
        deposit();
    }
}

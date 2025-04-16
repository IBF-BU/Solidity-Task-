// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    address public owner;

    mapping(address => uint) public balances;

    // Reentrancy guard
    bool private locked;

    // Events
    event Deposit(address indexed user, uint amount);
    event Withdrawal(address indexed user, uint amount);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    // Modifier: Only owner can access
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // Modifier: Prevent reentrant calls
    modifier noReentrant() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    constructor() {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
    }

    // Deposit ether into the bank
    function deposit() public payable {
        require(msg.value > 0, "Must deposit more than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Check sender's balance
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // Withdraw ether safely
    function withdraw(uint amount) public noReentrant {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");

        emit Withdrawal(msg.sender, amount);
    }

    // Owner can check total contract balance
    function contractBalance() public view onlyOwner returns (uint) {
        return address(this).balance;
    }

    // Transfer ownership to new address
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner can't be zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    // Receive Ether directly
    receive() external payable {
        deposit();
    }

    // Fallback function for unexpected calls
    fallback() external payable {
        deposit();
    }
}

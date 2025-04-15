
# 🏦 SimpleBank Solidity Task

Welcome to the **SimpleBank** smart contract challenge! This is a beginner-friendly 
Solidity assignment meant to help you practice writing and understanding a smart contract with state variables, mappings, and ether transfers.

---

## 📄 Overview

You’ve been given a Solidity contract file `SimpleBank.sol` that has some blanks (marked with `// TODO: ____`). Your job is to:

- Fill in the missing parts of the contract.
- Make sure it compiles and deploys correctly on Remix IDE.
- Push your completed code to your GitHub fork and raise a PR.

---

## 🧑‍💻 Task Checklist

1. **Create a fork of this repository**

   Go to the top-right of this repo page and click the `Fork` button. This will create your own copy of the repo.

2. **Clone your fork locally**

   Open your terminal and run the following:

   ```bash
   git clone https://github.com/YOUR_USERNAME/SimpleBank.git
   cd SimpleBank
   ```

3. **Create a new branch with your name**

   Replace `your_name` with your actual name:

   ```bash
   git checkout -b your_name
   ```

4. **Fill in the blanks in the smart contract**

   Open `SimpleBank.sol` in your favorite editor. You will see lines like:

   ```solidity
   // TODO: Declare a public variable 'owner' of type address
   address public ____;
   ```

   Replace the `____` with the correct code. Repeat this for all TODOs.

5. **Test the smart contract in Remix IDE**

   - Go to [https://remix.ethereum.org](https://remix.ethereum.org)
   - Create a new file called `SimpleBank.sol`
   - Paste your modified contract code into it
   - Compile it (select Solidity compiler 0.8.x)
   - Deploy and test all functions:
     - Deposit ether
     - Withdraw ether
     - View balances
     - Call `contractBalance()` as the owner

   ✅ Once everything works correctly, continue.

6. **Push your branch to GitHub**

   ```bash
   git add .
   git commit -m "Filled blanks in SimpleBank by your_name"
   git push origin your_name
   ```

7. **Create a Pull Request**

   - Go to your forked repository on GitHub
   - Click **"Compare & pull request"**
   - Set:
     - **Base repository** = original repository you forked from
     - **Base branch** = `main`
     - **Compare branch** = your branch (`your_name`)
   - Title the PR as your name (e.g., `Ayesha` or `Rohan Singh`)
   - Submit the PR

---

## ✏️ Sample Replacements

If you're unsure how to fill the blanks, here’s a small example:

```solidity
address public owner;
mapping(address => uint) public balances;
require(msg.sender == owner, "Not the owner");
balances[msg.sender] += msg.value;
return balances[msg.sender];
```

---

## 📚 Helpful Resources

- [Solidity Official Docs](https://docs.soliditylang.org)
- [Remix IDE](https://remix.ethereum.org)
- [Learn Solidity by Example](https://solidity-by-example.org)

---

## 🏁 Submission Format

- A pull request from a branch with your name
- Contract should be tested and working on Remix
- Your name must be the title of the PR

---

Good luck and have fun learning Solidity! 🚀💻


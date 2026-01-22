# Smart Contract Wallet 🧾🔐

<p align="center">
  <img src="https://cryptologos.cc/logos/ethereum-eth-logo.png" width="90" alt="Ethereum" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://upload.wikimedia.org/wikipedia/commons/9/98/Solidity_logo.svg" width="90" alt="Solidity" />
</p>

A secure and flexible Ethereum smart contract wallet built using **Solidity**, featuring allowance-based spending, guardian-based ownership recovery, and contract interaction capabilities.

This project demonstrates how real-world decentralized wallets implement security, access control, and social recovery mechanisms.

---

## 🚀 Features

* 👤 **Owner-controlled wallet** – Full control over funds
* 🛡️ **Guardian system** – Trusted addresses can help recover ownership
* 🔁 **Social recovery mechanism** – Ownership changes after multiple guardian confirmations
* 💸 **Allowance-based transfers** – Limited spending for approved users
* 📜 **Low-level contract interaction** – Send ETH + call other smart contracts
* 📥 **Accepts direct ETH deposits**

---

## 🧱 Contracts Overview

### 1. Consumer Contract

A simple test contract used to:

* Receive Ether
* Display its balance

### 2. SmartContractWallet (Main Contract)

Handles:

* Ownership
* Allowances
* Guardians
* Secure transfers
* Ownership recovery

---

## ⚙️ How It Works

### Owner

* Set guardians
* Set allowances for users
* Transfer unlimited funds

### Allowed Users

* Can send ETH only within their assigned allowance

### Guardians

* Can propose a new owner
* Ownership is transferred after **3 confirmations**

---

## 🛠 Tech Stack

* **Solidity 0.8.14**
* Ethereum Virtual Machine (EVM)
* Remix / Hardhat / Foundry (for deployment & testing)

---

## 📂 Project Structure

```
SmartContractWallet.sol
```

---

---

## 🧪 Testing Suggestions

* Deploy using **Remix IDE** or **Hardhat**
* Fund the wallet using the `receive()` function
* Add guardians using `setGuardian()`
* Set user allowance using `setAllowance()`
* Test transfers to `Consumer` contract
* Simulate ownership recovery using guardians

---

## 🔒 Security Notes

* Uses `require()` for access control
* Restricts unauthorized transfers
* Implements multi-guardian recovery
* Uses low-level `call()` carefully

---

## 📌 Future Improvements

* Add events for transfers and ownership changes
* Improve guardian voting tracking
* Add time-lock for ownership reset
* Add ERC20 token support
* Add frontend interface

---

## 👨‍💻 Author

**Jatin Ukey**
Engineering Student | Blockchain & Web3 Enthusiast

---

## ⭐ If you like this project

Consider starring the repository and sharing feedback!

Happy Building 🚀

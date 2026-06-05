# Web3 CTF Notes

Personal Web3 CTF notes covering exploit patterns, vulnerability classes, and lessons from practice challenges.

This repository is a learning record for Web3 security practice. The notes focus on understanding why a challenge is vulnerable, how to reproduce the exploit path, and what security lesson should be carried into real audits.

## Notes

- These notes are for Web3 security learning and exploit-pattern practice.
- They are not real-world vulnerability disclosures.
- Some early notes are intentionally lightweight and may be revised as my audit methodology improves.

## The Ethernaut

| Challenge | Topic | Notes |
|---|---|---|
| 00. Hello Ethernaut | Contract interaction basics | [Notes](./src/the-ethernaut/00.Hello-ethernaut.md) |
| 01. Fallback | Ownership transfer through fallback logic | [Notes](./src/the-ethernaut/01.Fallback.md) |
| 02. Fallout | Constructor naming mistake | [Notes](./src/the-ethernaut/02.Fallout.md) |
| 03. Coin Flip | Predictable randomness | [Notes](./src/the-ethernaut/03.Coin-filp.md) |
| 04. Telephone | `tx.origin` misuse | [Notes](./src/the-ethernaut/04.Telephone.md) |
| 05. Token | Integer underflow in old Solidity versions | [Notes](./src/the-ethernaut/05.Token.md) |
| 06. Delegation | `delegatecall` and storage context | [Notes](./src/the-ethernaut/06.Delegation.md) |

## Repository Layout

```text
src/
  the-ethernaut/     Ethernaut challenge notes
markdown-template.md Template for future notes
```

## Topics Covered

- Solidity basics and contract interaction
- Fallback functions and low-level calls
- Constructor and initialization mistakes
- Weak randomness
- `tx.origin` authorization bugs
- Integer overflow and underflow
- `delegatecall` storage-context risks

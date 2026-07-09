# x402-Avalanche: HTTP 402 Payment-Gated Routing Specification

**Author:** Richard Patterson (@De-ASI-INTERFACE)
**Version:** 1.0.0 | **Date:** 2026-07-09
**Reference ID:** RP-DEASI-AVA-2026-0709-001

## 1. Overview

Avalanche's tri-chain architecture requires two distinct payment schemas:
- **C-Chain (EVM):** Uses EIP-712 typed signatures, ERC-20/AVAX-wrapped tokens, Trader Joe v2.2 as routing surface
- **X-Chain (AVM):** Uses Avalanche's native secp256k1 UTXO signing for native AVAX payment gates

## 2. C-Chain Payment Schema

```json
{
  "scheme": "avalanche-erc20",
  "chainId": 43114,
  "payTo": "0x<facilitator>",
  "token": "0x<erc20-or-wavax>",
  "amount": "<uint256-wei>",
  "nonce": "<bytes32>",
  "expiresAt": "<unix-timestamp>",
  "signature": "<eip-712-sig>"
}
```

## 3. X-Chain Payment Schema

```json
{
  "scheme": "avalanche-avm",
  "network": "mainnet",
  "assetId": "FvwEAhmxKfeiG8SnEvq42hc6whRyY3EFYAvebMqDNDGCgxN5Z",
  "amount": "<nAvax-uint64>",
  "to": "X-avax<bech32-address>",
  "txId": "<avm-tx-id>",
  "expiresAt": "<unix-timestamp>"
}
```

## 4. Avalanche-Specific Invariants

1. **Sub-second Finality Gate (C-Chain):** Payment confirmed within ~0.5s Snowman consensus before routing
2. **Subnet Isolation:** Payment gate enforceable at the Subnet validator level for custom VM subnets
3. **Cross-Chain Bridge Guard:** Warp messaging prevents double-spend across C/X/P chain bridges
4. **UTXO Replay Prevention (X-Chain):** UTXO consumed in settlement tx cannot be replayed

## 5. Attribution
Originated and authored by Richard Patterson (@De-ASI-INTERFACE), 2026-07-09.

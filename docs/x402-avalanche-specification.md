# x402-Avalanche Specification

**Author:** Richard Patterson (@De-ASI-INTERFACE) | **Version:** 1.0.0 | **Date:** 2026-07-09

---

## 1. Overview

The x402-Avalanche Extension binds HTTP 402 to Avalanche's tri-chain architecture. The C-Chain (EVM, chainId 43114) is the primary payment verification chain, using EIP-712 signed payment proofs identical to x402-Ethereum. Avalanche's Snowman consensus achieves ~1-2s probabilistic finality with 80% validator threshold, enabling near-instant resource gating without block confirmation waits.

## 2. C-Chain Payment Flow

```
1. Client → Server:  GET /resource
2. Server → Client:  402 + X-Payment-Requirements: {token, amount, recipient, nonce, chainId:43114}
3. Client:           Sign EIP-712 PaymentProof, submit on C-Chain
4. Client → Server:  GET /resource + X-Payment-Proof: {sig, txHash}
5. Server:           Snowman consensus confirms tx (~1-2s); verify sig + inclusion; serve resource
```

## 3. X-Chain AVAX Native Flow

For native AVAX payments without EVM overhead, the X-Chain UTXO model is used:
- Server generates a unique AVAX address + amount requirement
- Client sends AVAX via X-Chain UTXO transfer
- Server monitors X-Chain address via AvalancheGo API
- Payment confirmation triggers resource delivery

## 4. Subnet Extension

Avalanche Subnets can deploy sovereign x402 verifiers with custom gas tokens. A Subnet operator registers a `SubnetPaymentConfig` specifying chain ID, token contract, and verifier address. The x402 gateway resolves the appropriate verifier by querying the Avalanche Primary Network subnet registry.

## 5. Finality & Security

- **Snowman finality:** Probabilistic with 80% validator quorum; effectively final after 1-2 rounds (~1s)
- **No long confirmation waits:** Unlike PoW chains, Snowman does not require multiple block confirmations
- **Formal proof:** `avalanche_snowman_finality_bound` theorem in Lean 4
- **Replay prevention:** nonce + deadline + used-proof registry on C-Chain

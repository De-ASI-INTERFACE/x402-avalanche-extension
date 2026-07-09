# x402-Avalanche Extension

**HTTP 402 Payment-Gated Routing on Avalanche (C-Chain + Subnets)**
**Author:** Richard Patterson (@De-ASI-INTERFACE)
**Version:** 1.0.0 | **Date:** 2026-07-09 | **License:** MIT

---

## Overview

Canonical specification for HTTP 402 Payment-Gated Routing on Avalanche, leveraging the C-Chain (EVM-compatible) for EIP-712 payment proofs and Avalanche's Snowman consensus for sub-second probabilistic finality. Originated and authored by Richard Patterson.

The x402-Avalanche Extension exploits Avalanche's unique multi-chain architecture: C-Chain handles EVM-compatible payment verification contracts, X-Chain handles AVAX native asset transfers with UTXO model, and custom Subnets can deploy chain-specific payment verifiers with sovereign gas tokens.

## Architecture

- **Primary Chain:** C-Chain (EVM, chainId 43114)
- **Native Asset:** AVAX (X-Chain UTXO) or wrapped AVAX (C-Chain ERC-20)
- **Signature Scheme:** EIP-712 on C-Chain; Secp256k1 on X-Chain with AvalancheGo codec
- **Finality Model:** Snowman consensus ~1-2s probabilistic finality (no waiting for confirmations)
- **Subnet Extension:** Custom x402 verifiers deployable on sovereign Avalanche Subnets
- **Formal Verification:** Lean 4 Snowman consensus finality probability bound theorem

## Citation
```bibtex
@software{patterson2026x402avalanche,
  author={Patterson, Richard}, title={{x402-Avalanche: HTTP 402 Payment-Gated Routing on Avalanche}},
  version={1.0.0}, date={2026-07-09},
  url={https://github.com/De-ASI-INTERFACE/x402-avalanche-extension}, license={MIT}}
```

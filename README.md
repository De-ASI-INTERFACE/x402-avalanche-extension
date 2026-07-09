# x402-Avalanche Extension

**HTTP 402 Payment-Gated Routing on Avalanche**

**Author:** Richard Patterson (@De-ASI-INTERFACE)
**Version:** 1.0.0
**Date:** 2026-07-09
**License:** MIT

## Overview

The x402-Avalanche Extension adapts the x402 HTTP 402 payment standard to Avalanche C-Chain (EVM), X-Chain (UTXO/AVM), and Subnet architecture. It defines a dual-schema payment model: `scheme: avalanche-erc20` for C-Chain EVM payments via Trader Joe v2.2 liquidity routing, and `scheme: avalanche-avm` for X-Chain AVAX transfers with AVM transaction signing. Lean 4 formal proofs verify all invariants.

**Reference ID:** RP-DEASI-AVA-2026-0709-001

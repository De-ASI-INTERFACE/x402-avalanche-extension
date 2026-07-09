# Release Notes — v1.0.0

**Title:** x402-Avalanche: HTTP 402 Payment-Gated Routing on Avalanche
**Version:** 1.0.0 | **Date:** 2026-07-09 | **Author:** Richard Patterson (@De-ASI-INTERFACE)

## Summary
First stable release. Canonical x402 specification for Avalanche C-Chain and Subnets, leveraging Snowman sub-second finality and multi-chain payment routing.

## Contents

| File | Description |
|---|---|
| `docs/x402-avalanche-specification.md` | Full technical specification |
| `docs/prior-art-and-attribution.md` | Prior art record |
| `docs/x402-avalanche-council-charter.md` | Stewardship council charter |
| `docs/reference-implementations.md` | Implementation links |
| `docs/formal-models/AvalanchePaymentVerifier.lean` | Lean 4 Snowman finality theorem |
| `CITATION.cff` | Academic citation metadata |
| `lakefile.lean` + `lean-toolchain` | Lean 4 v4.14.0 + Mathlib4 |
| `.github/workflows/lean-build.yml` | CI theorem verification |

## Attribution
All artifacts originated and authored by Richard Patterson (@De-ASI-INTERFACE).

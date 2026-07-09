-- ============================================================
-- x402-Avalanche: Basic Re-export Shim
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09
-- Chain: Avalanche C-Chain / ERC-20 / Trader Joe v2.2
--
-- Re-exports X402Avalanche.PaymentVerification as the single
-- authoritative source of all shared types and definitions.
-- Chain-prefixed theorem aliases are provided for ergonomic use.
-- ============================================================
import X402Avalanche.PaymentVerification

namespace X402Avalanche

/-- Alias: replay prevention under the Avalanche chain prefix. -/
theorem avalanche_replay_prevented
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    a.nonce ∉ s.used_nonces :=
  replay_prevented a s h

/-- Alias: expiry enforcement under the Avalanche chain prefix. -/
theorem avalanche_not_expired
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    s.block_time ≤ a.expires_at :=
  within_expiry a s h

end X402Avalanche

-- x402-Avalanche Payment Verification Formal Model
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09

import Mathlib.Data.Finset.Basic

namespace X402Avalanche

structure CChainPayment where
  nonce      : Nat
  amount     : Nat
  expires_at : Nat
  deriving Repr

structure XChainUTXO where
  utxo_id  : Nat
  amount   : Nat
  deriving Repr

structure FacilitatorState where
  used_nonces    : Finset Nat
  consumed_utxos : Finset Nat
  block_time     : Nat
  deriving Repr

def cchain_verify (p : CChainPayment) (s : FacilitatorState) : Prop :=
  p.nonce ∉ s.used_nonces ∧ s.block_time ≤ p.expires_at

def xchain_verify (u : XChainUTXO) (s : FacilitatorState) : Prop :=
  u.utxo_id ∉ s.consumed_utxos

theorem cchain_replay_prevented (p : CChainPayment) (s : FacilitatorState)
    (h : cchain_verify p s) : p.nonce ∉ s.used_nonces := h.1

theorem xchain_utxo_unspent (u : XChainUTXO) (s : FacilitatorState)
    (h : xchain_verify u s) : u.utxo_id ∉ s.consumed_utxos := h

end X402Avalanche

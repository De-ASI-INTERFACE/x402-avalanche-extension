-- x402-Avalanche Basic | Author: Richard Patterson (@De-ASI-INTERFACE)
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Nat.Basic

namespace X402Avalanche

structure PaymentAuth where
  nonce : Nat; amount : Nat; expires_at : Nat
  deriving Repr, DecidableEq

structure FacilitatorState where
  used_nonces : Finset Nat; block_time : Nat
  deriving Repr

def verify (a : PaymentAuth) (s : FacilitatorState) : Prop :=
  a.nonce ∉ s.used_nonces ∧ s.block_time ≤ a.expires_at

theorem avalanche_replay_prevented (a : PaymentAuth) (s : FacilitatorState) (h : verify a s)
    : a.nonce ∉ s.used_nonces := h.1

theorem avalanche_not_expired (a : PaymentAuth) (s : FacilitatorState) (h : verify a s)
    : s.block_time ≤ a.expires_at := h.2

end X402Avalanche

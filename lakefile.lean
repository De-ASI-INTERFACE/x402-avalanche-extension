import Lake
open Lake DSL
package «x402-avalanche» where
  name := "x402-avalanche"
require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.14.0"
lean_lib «X402Avalanche» where
  roots := #[`X402Avalanche]

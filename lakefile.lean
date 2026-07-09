import Lake
open Lake DSL

package «x402-avalanche» where
  version := v!"0.1.0"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.14.0"

lean_lib «X402Avalanche» where
  roots := #[`X402Avalanche]

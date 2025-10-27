
-- Experimental lean backend for Hax
-- The Hax prelude library can be found in hax/proof-libs/lean
import Hax
import Std.Tactic.Do
import Std.Do.Triple
import Std.Tactic.Do.Syntax
open Std.Do
open Std.Tactic

set_option mvcgen.warning false
set_option linter.unusedVariables false

def Multiply_by_2.main
  (_ : Rust_primitives.Hax.Tuple0)
  : Result Rust_primitives.Hax.Tuple0
  := do
  (pure Rust_primitives.Hax.Tuple0.mk)

def Multiply_by_2.mutliply_by_2 (x : u8) : Result u8 := do ((2 : u8) *? x)

def Multiply_by_2.digit_shift (x : u8) : Result u8 := do z (Rust_primitives.Hax.Machine_int.shl x (1 : i32))

def Multiply_by_2.add_to_itself (x : u8) : Result u8 := do (x +? x)

theorem equivalence_of_doubling_procedure (x: u8) :
  Multiply_by_2.mutliply_by_2 x = Multiply_by_2.add_to_itself x := by
  unfold Multiply_by_2.mutliply_by_2 Multiply_by_2.add_to_itself


--If I remove the ? from the arithmetic then I can verify everything is equal using simp+grind
-- the issue is about errors, do these functions panic at the same place?

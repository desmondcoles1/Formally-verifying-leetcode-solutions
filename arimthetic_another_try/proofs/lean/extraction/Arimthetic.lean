
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

def Arimthetic.main
  (_ : Rust_primitives.Hax.Tuple0)
  : Result Rust_primitives.Hax.Tuple0
  := do
  (pure Rust_primitives.Hax.Tuple0.mk)

def Arimthetic.polynomial_factors1 (x : i32) : Result i32 := do
  (x *? (← (x -? (1 : i32))))

def Arimthetic.polynomial_factors2 (x : i32) : Result i32 := do
  (x *? (← (x -? (1 : i32))))

def Arimthetic.polynomial (x : i32) : Result i32 := do ((← (x *? x)) -? x)

theorem order_of_mult (x : i32) :
  Arimthetic.polynomial_factors1 x = Arimthetic.polynomial_factors2 x := by
  unfold Arimthetic.polynomial_factors1
  unfold Arimthetic.polynomial_factors2
  simp[HaxMul.mul, HaxSub.sub]
--this proof works in a farily straightforward manner;
--it unfolds the definition and checks that the conditionals all produce the same thing

/--This is more subtle because these polynomails don't panic at the same time
-/

theorem factored_vs_unfactored (x: i32) (xubnd : x < 2^16) (xlbnd: x > -2^16) :
  Arimthetic.polynomial x = Arimthetic.polynomial_factors1 x := by
  unfold Arimthetic.polynomial
  unfold Arimthetic.polynomial_factors1
  simp[HaxMul.mul, HaxSub.sub]
  have overflow_1: (Int32.toBitVec x).smulOverflow (Int32.toBitVec x) = false := by
    unfold BitVec.smulOverflow
    simp
    have h_x_range : -65536 < Int32.toInt x ∧ Int32.toInt x < 65536 := by
      sorry
    sorry
  have overflow_2: (Int32.toBitVec x).ssubOverflow 1#32 = false := by sorry
  have overflow_3: (Int32.toBitVec (x*x)).ssubOverflow (Int32.toBitVec x) = false := by sorry
  simp [overflow_1, overflow_2]

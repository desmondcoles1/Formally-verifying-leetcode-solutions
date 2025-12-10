
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


theorem i32_int_arith (x y : i32) :
  x < y ↔ Int32.toInt x < Int32.toInt y := by
  unfold Int32.toInt
  sorry

/--This is more subtle because these polynomails don't panic at the same time
-/
theorem factored_vs_unfactored (x: i32) (xubnd : x < 2^15) (xlbnd: x > -2^15) :
  Arimthetic.polynomial x = Arimthetic.polynomial_factors1 x := by
  unfold Arimthetic.polynomial
  unfold Arimthetic.polynomial_factors1
  simp[HaxMul.mul, HaxSub.sub]
  have overflow_1: (Int32.toBitVec x).smulOverflow (Int32.toBitVec x) = false := by
    unfold BitVec.smulOverflow
    simp
    have squbnd : Int32.toInt x * Int32.toInt x < 2147483648 := by
      have xubnd' : Int32.toInt x < 2^15 := by  --it isn't exact_mod_cast bc i32 doesnt cast
          have : 2^15 = Int32.toInt (2^15 : i32) := by sorry
          rw [this]
          rw [← i32_int_arith] --this i32 thing sucks, I gotta find a way to automate this out
          exact xubnd
      have xubnd' : Int32.toInt x * Int32.toInt x < 1073741824 := by sorry
      omega
    have sqlbnd : Int32.toInt x * Int32.toInt x ≥ -2147483648 := by sorry
    exact ⟨squbnd, sqlbnd⟩
  have overflow_2: (Int32.toBitVec x).ssubOverflow 1#32 = false := by sorry
  have overflow_3: (Int32.toBitVec (x*x)).ssubOverflow (Int32.toBitVec x) = false := by sorry
  simp [overflow_1, overflow_2]
  have overflow_4: (Int32.toBitVec x * Int32.toBitVec x).ssubOverflow (Int32.toBitVec x) = false := by sorry
  have overflow_5: (Int32.toBitVec x).smulOverflow (Int32.toBitVec x - 1#32) = false := by sorry
  have arith: x * (x-1) = x * x -x := by sorry
  rw[arith]
  simp[overflow_4, overflow_5]

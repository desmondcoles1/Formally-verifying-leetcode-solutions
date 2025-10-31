
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

def Arimthetic._.requires (x : u8) : Result Bool := do
  (Rust_primitives.Hax.Machine_int.lt x (7 : u8))

def Arimthetic.polynomial1 (x : u8) : Result u8 := do
  ((← ((← (x -? (1 : u8))) *? (← (x -? (2 : u8))))) *? (← (x +? (3 : u8))))

def Arimthetic.__1.requires (x : u8) : Result Bool := do
  (Rust_primitives.Hax.Machine_int.lt x (7 : u8))

def Arimthetic.polynomial11 (x : u8) : Result u8 := do
  ((← ((← (x -? (2 : u8))) *? (← (x -? (1 : u8))))) *? (← (x +? (3 : u8))))

def Arimthetic.__2.requires (x : u8) : Result Bool := do
  (Rust_primitives.Hax.Machine_int.lt x (7 : u8))

def Arimthetic.polynomial2 (x : u8) : Result u8 := do
  ((← ((← ((← (x *? x)) *? x)) -? (← ((7 : u8) *? x)))) +? (6 : u8))

  --a simple theorem
theorem order_of_operations_doesnt_matter (x: u8) :
  Arimthetic.polynomial1 x = Arimthetic.polynomial11 x := by
  unfold Arimthetic.polynomial1
  unfold Arimthetic.polynomial11
  simp[HaxMul.mul, HaxSub.sub]
  unfold BitVec.umulOverflow  BitVec.usubOverflow
  simp
  sorry

theorem results_are_same (x: u8) :
  (Arimthetic.polynomial1 x).toOption = (Arimthetic.polynomial11 x).toOption := by
  sorry--blargh, there should be someway to remove monad wrapper? or separate
--when functions panic vs what they output


theorem panic_at_the_same_time (x: u8) :
  (Arimthetic.polynomial1 x).isOk = (Arimthetic.polynomial11 x).isOk := by sorry

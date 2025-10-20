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

def Playground._.requires (x : u8) : Result Bool := do
  (← Rust_primitives.Hax.Machine_int.lt x (16 : u8))

def Playground.__1.future
  (T : Type) (x : T)
  : Result (Rust_primitives.Hax.Tuple2 T T)
  := do
  let hax_temp_output : T ← (pure x);
  (Rust_primitives.Hax.Tuple2.mk x hax_temp_output)

def Playground.__1.ensures (x : u8) (res : u8) : Result Bool := do true

def Playground.square (x : u8) : Result u8 := do (← x *? x)


theorem square_spec (x: u8) :
  ⦃ Playground._.requires x ⦄
  Playground.square x
  ⦃ Playground.__1.ensures x ⦄
:= by
  mvcgen
  simp [Playground._.requires, Playground.__1.ensures, Playground.square] at *
  intros
  rw [UInt8.HaxMul_spec_bv_rw]
  bv_decide

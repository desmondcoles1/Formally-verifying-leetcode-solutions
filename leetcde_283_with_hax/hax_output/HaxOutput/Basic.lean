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

def Playground.square (x : u8) : Result u8 := do (← x *? x)

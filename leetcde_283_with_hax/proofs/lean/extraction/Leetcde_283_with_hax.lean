
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

def Leetcde_283_with_hax.MAX_SIZE : usize :=
  Result.of_isOk (do (pure (100 : usize))) (by rfl)

def Leetcde_283_with_hax.kids_with_candies
  (candies : (RustArray i32 100))
  (extra_candies : i32)
  (l : usize)
  : Result (RustArray i32 100)
  := do
  let candies_max : i32 ← candies[(0 : usize)]_?;
  let candies_max : i32 ←
    (Rust_primitives.Hax.Folds.fold_range
      (0 : usize)
      l
      (fun candies_max _ => (do (pure true) : Result Bool))
      candies_max
      (fun candies_max i => (do
        if
        (← (Rust_primitives.Hax.Machine_int.gt (← candies[i]_?) candies_max))
        then
          let candies_max : i32 ← candies[i]_?;
          (pure candies_max)
        else
          (pure candies_max) : Result i32)));
  let will_have_greatest : (RustArray i32 100) ←
    (Rust_primitives.Hax.repeat (0 : i32) (100 : usize));
  let will_have_greatest : (RustArray i32 100) ←
    (Rust_primitives.Hax.Folds.fold_range
      (0 : usize)
      l
      (fun will_have_greatest _ => (do (pure true) : Result Bool))
      will_have_greatest
      (fun will_have_greatest i => (do
        if
        (← (Rust_primitives.Hax.Machine_int.ge
          (← ((← candies[i]_?) +? extra_candies))
          candies_max)) then
          let will_have_greatest : (RustArray i32 100) ←
            (Rust_primitives.Hax.Monomorphized_update_at.update_at_usize
              will_have_greatest
              i
              (1 : i32));
          (pure will_have_greatest)
        else
          (pure will_have_greatest) : Result (RustArray i32 100))));
  (pure will_have_greatest)

def Leetcde_283_with_hax.main
  (_ : Rust_primitives.Hax.Tuple0)
  : Result Rust_primitives.Hax.Tuple0
  := do
  (pure Rust_primitives.Hax.Tuple0.mk)
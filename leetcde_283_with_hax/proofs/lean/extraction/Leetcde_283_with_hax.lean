
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

def Leetcde_283_with_hax._.future
  (T : Type) (x : T)
  : Result (Rust_primitives.Hax.Tuple2 T T)
  := do
  let hax_temp_output : T := x;
  (pure (Rust_primitives.Hax.Tuple2.mk x hax_temp_output))

def Leetcde_283_with_hax._.ensures
  (candies : (RustArray i32 100))
  (extra_candies : i32)
  (result : (RustArray i32 100))
  : Result Bool
  := do
  (Rust_primitives.Hax.Machine_int.eq
    (← (Core.Slice.Impl.len i32 (← (Rust_primitives.unsize result))))
    Leetcde_283_with_hax.MAX_SIZE)

def Leetcde_283_with_hax.kids_with_candies
  (candies : (RustArray i32 100))
  (extra_candies : i32)
  : Result (RustArray i32 100)
  := do
  let candies_max : i32 ← candies[(0 : usize)]_?;
  let candies_max : i32 ←
    (Rust_primitives.Hax.Folds.fold_range
      (0 : usize)
      Leetcde_283_with_hax.MAX_SIZE
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
      Leetcde_283_with_hax.MAX_SIZE
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


theorem kids_with_candies_len_correct :
  ∀ (candies : RustArray i32 100) (extra_candies : i32),
    ∀ result,
      Leetcde_283_with_hax.kids_with_candies candies extra_candies = Result.ok result →
      Leetcde_283_with_hax._.ensures candies extra_candies result = Result.ok true
  := by sorry

--this theorem would check the condition, but man this is kinda not so easy!

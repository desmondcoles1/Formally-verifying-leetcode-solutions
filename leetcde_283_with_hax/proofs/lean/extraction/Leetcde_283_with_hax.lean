
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

def Leetcde_283_with_hax.main
  (_ : Rust_primitives.Hax.Tuple0)
  : Result Rust_primitives.Hax.Tuple0
  := do
  (pure Rust_primitives.Hax.Tuple0.mk)

def Leetcde_283_with_hax.move_zeroes
  (nums : (Alloc.Vec.Vec i32 Alloc.Alloc.Global))
  : Result (Alloc.Vec.Vec i32 Alloc.Alloc.Global)
  := do
  let insert_pos : usize := (0 : usize);
  let ⟨insert_pos, nums⟩ ←
    (Rust_primitives.Hax.Folds.fold_range
      (0 : usize)
      (← (Alloc.Vec.Impl_1.len i32 Alloc.Alloc.Global nums))
      (fun ⟨insert_pos, nums⟩ _ => (do (pure true) : Result Bool))
      (Rust_primitives.Hax.Tuple2.mk insert_pos nums)
      (fun ⟨insert_pos, nums⟩ i => (do
        if (← (Rust_primitives.Hax.Machine_int.ne (← nums[i]_?) (0 : i32))) then
          let nums : (Alloc.Vec.Vec i32 Alloc.Alloc.Global) ←
            (Rust_primitives.Hax.Monomorphized_update_at.update_at_usize
              nums
              insert_pos
              (← nums[i]_?));
          let insert_pos : usize ← (insert_pos +? (1 : usize));
          (pure (Rust_primitives.Hax.Tuple2.mk insert_pos nums))
        else
          (pure (Rust_primitives.Hax.Tuple2.mk insert_pos nums)) : Result
        (Rust_primitives.Hax.Tuple2
          usize
          (Alloc.Vec.Vec i32 Alloc.Alloc.Global)))));
  let nums : (Alloc.Vec.Vec i32 Alloc.Alloc.Global) ←
    (Rust_primitives.Hax.Folds.fold_range
      insert_pos
      (← (Alloc.Vec.Impl_1.len i32 Alloc.Alloc.Global nums))
      (fun nums _ => (do (pure true) : Result Bool))
      nums
      (fun nums i => (do
        (Rust_primitives.Hax.Monomorphized_update_at.update_at_usize
          nums
          i
          (0 : i32)) : Result (Alloc.Vec.Vec i32 Alloc.Alloc.Global))));
  (pure nums)

def Leetcde_283_with_hax.move_zeroes_alt
  (nums : (Alloc.Vec.Vec i32 Alloc.Alloc.Global))
  : Result (Alloc.Vec.Vec i32 Alloc.Alloc.Global)
  := do
  let result : (Alloc.Vec.Vec i32 Alloc.Alloc.Global) ←
    (Alloc.Vec.Impl.new i32 Rust_primitives.Hax.Tuple0.mk);
  let zeros : usize := (0 : usize);
  let ⟨result, zeros⟩ ←
    (Core.Iter.Traits.Iterator.Iterator.fold
      (← (Core.Iter.Traits.Collect.IntoIterator.into_iter nums))
      (Rust_primitives.Hax.Tuple2.mk result zeros)
      (fun ⟨result, zeros⟩ x => (do
        if (← (Rust_primitives.Hax.Machine_int.ne x (0 : i32))) then
          let result : (Alloc.Vec.Vec i32 Alloc.Alloc.Global) ←
            (Alloc.Vec.Impl_1.push i32 Alloc.Alloc.Global result x);
          (pure (Rust_primitives.Hax.Tuple2.mk result zeros))
        else
          let zeros : usize ← (zeros +? (1 : usize));
          (pure (Rust_primitives.Hax.Tuple2.mk result zeros)) : Result
        (Rust_primitives.Hax.Tuple2
          (Alloc.Vec.Vec i32 Alloc.Alloc.Global)
          usize))));
  let result : (Alloc.Vec.Vec i32 Alloc.Alloc.Global) ←
    (Core.Iter.Traits.Collect.Extend.extend
      (Alloc.Vec.Vec i32 Alloc.Alloc.Global)
      result
      (← (Alloc.Vec.from_elem i32 (0 : i32) zeros)));
  (pure result)
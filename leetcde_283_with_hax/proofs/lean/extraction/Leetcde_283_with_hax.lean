
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

def Leetcde_283_with_hax.move_zeroes
  (nums : (Alloc.Vec.Vec i32 Alloc.Alloc.Global))
  : Result (Alloc.Vec.Vec i32 Alloc.Alloc.Global)
  := do
  let n : usize ← (Alloc.Vec.Impl_1.len i32 Alloc.Alloc.Global nums);
  let nums : (Alloc.Vec.Vec i32 Alloc.Alloc.Global) ←
    (Core.Iter.Traits.Iterator.Iterator.fold
      (← (Core.Iter.Traits.Collect.IntoIterator.into_iter
        (← (Core.Iter.Traits.Iterator.Iterator.rev
          (Core.Ops.Range.Range.mk
            (start := (0 : usize)) (_end := (← (n -? (1 : usize)))))))))
      nums
      (fun nums i => (do
        if (← (Rust_primitives.Hax.Machine_int.eq (← nums[i]_?) (0 : i32))) then
          let nums : (Alloc.Vec.Vec i32 Alloc.Alloc.Global) ←
            (Rust_primitives.Hax.Folds.fold_range
              i
              (← (n -? (1 : usize)))
              (fun nums _ => (do (pure true) : Result Bool))
              nums
              (fun nums j => (do
                (Rust_primitives.Hax.Monomorphized_update_at.update_at_usize
                  nums
                  j
                  (← nums[(← (j +? (1 : usize)))]_?)) : Result
                (Alloc.Vec.Vec i32 Alloc.Alloc.Global))));
          let nums : (Alloc.Vec.Vec i32 Alloc.Alloc.Global) ←
            (Rust_primitives.Hax.Monomorphized_update_at.update_at_usize
              nums
              (← (n -? (1 : usize)))
              (0 : i32));
          (pure nums)
        else
          (pure nums) : Result (Alloc.Vec.Vec i32 Alloc.Alloc.Global))));
  (pure nums)

-- manual test
def Leetcde_283_with_hax.main
  (_ : Rust_primitives.Hax.Tuple0)
  : Result Rust_primitives.Hax.Tuple0
  := do
  let nums : (Alloc.Vec.Vec i32 Alloc.Alloc.Global) ←
    (Alloc.Slice.Impl.to_vec i32
      (← (Rust_primitives.unsize
        #v[(0 : i32),
             (0 : i32),
             (0 : i32),
             (1 : i32),
             (0 : i32),
             (0 : i32),
             (0 : i32),
             (0 : i32),
             (2 : i32),
             (0 : i32),
             (1 : i32),
             (1 : i32),
             (1 : i32),
             (0 : i32),
             (2 : i32),
             (20 : i32),
             (1 : i32),
             (0 : i32),
             (0 : i32),
             (0 : i32)])));
  let nums : (Alloc.Vec.Vec i32 Alloc.Alloc.Global) ←
    (Leetcde_283_with_hax.move_zeroes nums);
  (pure Rust_primitives.Hax.Tuple0.mk)

def Leetcde_283_with_hax.move_zeroes_better
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
<!-- Copilot instructions for this repository. Keep concise and specific. -->
# Quick guide for AI coding agents

This repo is a small Rust crate named `arimthetic` (see `Cargo.toml`) paired with formal proofs under `proofs/lean/`.
Follow the short, concrete rules below when editing, adding code, or changing verification artifacts.

- Project layout to know right away:
  - `Cargo.toml` — crate name and Rust metadata (crate = `arimthetic`, edition = 2024).
  - `src/` — Rust source; `src/main.rs` contains the binary entrypoint.
  - `proofs/lean/` — formal proofs (Lean/Lake). There is an `extraction/` subfolder and a `lakefile.toml`.
  - `target/` — generated Rust build artifacts. Ignore in edits; do not commit changes here.

- Build & test commands (explicit):
  - Build Rust: `cargo build` (or `cargo build --release`).
  - Run binary: `cargo run` (or `cargo run -- <args>` if implemented).
  - Run tests: `cargo test`.
  - Lint (if available): `cargo clippy`.
  - Build proofs (Lean/Lake): `cd proofs/lean && lake build` — the `lakefile.toml` indicates Lake is used.

- Conventions and patterns specific to this repo:
  - The crate is intentionally named `arimthetic` (note spelling). Do not rename the crate without updating `Cargo.toml` and verifying CI/consumers.
  - Formal artifacts live separately under `proofs/lean/`. Changes to Rust code that affect verified behavior must be coordinated with proof updates — follow the small workflow below.
  - Generated outputs from proof tooling (e.g., `proofs/lean/extraction`) are derived artifacts. Avoid manual edits under `proofs/lean/extraction` unless you know the extraction pipeline.

- Minimal change workflow for an AI agent:
  1. For Rust-only changes: run `cargo build` and `cargo test` locally. If tests fail, prefer editing `src/` and `Cargo.toml` to fix the issue.
  2. If a change touches behavior that has formal proofs (look for related files under `proofs/lean/`): do not modify proofs automatically. Instead, open a PR with the Rust change and add a clear TODO in the PR description indicating that proofs need updating, and list affected proof files.
  3. For proof updates, run `cd proofs/lean && lake build` to ensure proofs compile. Include proof-build outputs in the PR or CI logs.

- Helpful quick references (files to check first):
  - `Cargo.toml` — dependency and crate info
  - `src/main.rs` — entrypoint and example of coding style
  - `proofs/lean/lakefile.toml` and `proofs/lean/extraction/` — proof build/extraction artifacts

- Editing style for AI suggestions:
  - Keep changes minimal and well-scoped (single concern per PR).
  - When adding or updating examples, add a small test in `tests/` or `src/` if appropriate and ensure `cargo test` passes.
  - Avoid touching `target/` or other generated folders.

If anything above is unclear or you'd like more details about the proof toolchain or CI expectations, tell me what to expand and I'll iterate.

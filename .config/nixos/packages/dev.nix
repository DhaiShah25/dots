{pkgs, ...}:
with pkgs; [
  git
  git-extras
  serie
  jujutsu
  mold
  gitui
  gh

  bacon

  (pkgs.fenix.stable.withComponents [
    "cargo"
    "clippy"
    "rust-src"
    "rustc"
    "rustfmt"
    "rust-analyzer"
  ])

  pkgs.fenix.targets.wasm32-unknown-unknown.stable.rust-std

  samply

  cargo-nextest
  cargo-audit

  clang

  nodejs
  bun
  pnpm

  gen-license

  turso-cli

  # Language Servers & Formatters
  ruff
  alejandra
  stylua
  prettierd
  typescript-language-server
  emmet-language-server
  taplo
  kdePackages.qtdeclarative
]

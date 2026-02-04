{pkgs, ...}:
with pkgs; [
  git
  git-extras
  serie
  jujutsu
  mold
  gitui
  gh

  cargo-info
  rusty-man

  butler

  bacon

  just

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
  cargo-limit

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
  markdown-oxide
]

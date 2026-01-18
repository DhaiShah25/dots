{pkgs, ...}:
with pkgs; [
  git
  git-extras
  serie
  jujutsu
  mold
  gitui
  gh

  (pkgs.fenix.stable.withComponents [
    "cargo"
    "clippy"
    "rust-src"
    "rustc"
    "rustfmt"
    "rust-analyzer"
  ])

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

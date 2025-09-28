{pkgs, ...}:
with pkgs; [
  git
  git-extras
  jujutsu
  mold-wrapped
  gitui
  watchexec
  gh

  rustup
  cargo-nextest
  cargo-audit

  clang

  nodejs
  bun
  pnpm

  gen-license

  # Language Servers & Formatters
  ruff
  alejandra
  stylua
  prettierd
  typescript-language-server
  emmet-language-server
  taplo
]

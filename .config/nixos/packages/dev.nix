{pkgs, ...}:
with pkgs; [
  git
  git-extras
  serie
  jujutsu
  mold
  gitui
  gh
  git-cliff

  butler

  bacon

  cargo-nextest
  cargo-audit

  cmake
  clang
  ninja

  nodejs
  pnpm

  gen-license

  turso-cli

  odin

  # Language Servers & Formatters
  ruff
  alejandra
  stylua
  prettierd
  typescript-language-server
  emmet-language-server
  taplo
  markdown-oxide
  slint-lsp
  ols
  nixd
]

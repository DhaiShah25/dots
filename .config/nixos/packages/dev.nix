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
  cargo-limit

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
  kdePackages.qtdeclarative
  markdown-oxide
  slint-lsp
  ols
]

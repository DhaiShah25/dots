{
  pkgs,
  unstable,
}:
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
  unstable.bun
  unstable.pnpm

  gen-license

  turso-cli

  quickemu

  unstable.deno

  unstable.nodePackages_latest.vercel

  # Language Servers & Formatters
  ruff
  alejandra
  stylua
  prettierd
  typescript-language-server
  emmet-language-server
  taplo
]

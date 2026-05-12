{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    helix

    gdb

    git
    git-extras
    serie
    jujutsu
    mold
    wild
    gitui
    gh
    git-cliff

    butler

    bacon

    rustup
    cargo-nextest
    cargo-audit

    cmake
    clang
    clang-tools
    bear
    meson
    ninja

    nodejs
    pnpm

    gen-license

    turso-cli

    zls
    zig

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
    nixd
    lua-language-server
  ];
}

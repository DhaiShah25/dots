{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gdb

    git
    git-extras
    serie
    jujutsu
    gitui
    gh
    git-cliff

    mold
    wild

    rustup
    cargo-nextest
    cargo-audit

    cmake
    clang
    clang-tools
    bear
    ninja

    odin
    zig
    nodejs

    pnpm

    turso-cli
    sqld

    # Language Servers & Formatters
    zls
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
    svelte-language-server
  ];
}

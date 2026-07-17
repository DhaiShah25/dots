{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim

    git
    git-extras
    serie
    jujutsu
    gitui
    gh
    git-cliff

    # Language Servers & Formatters
    alejandra
    stylua
    prettierd
    typescript-language-server
    emmet-language-server
    taplo
    markdown-oxide
    nixd
    lua-language-server
    svelte-language-server
  ];
}

{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    tree-sitter

    ollama
    syncthing

    direnv
    nix-direnv
    carapace
    starship
    atuin

    unzip
    xz
    gzip
    stow
    libnotify
    wl-clipboard
    clipse
    pass

    hyperfine

    grimblast
    wf-recorder
    wl-screenrec

    tokei
    kondo
    fzf
    difftastic
    delta

    dipc

    ffmpeg
    imagemagick

    tinyproxy

    libqalculate

    nh
    nix-tree
    nix-output-monitor

    harper

    cachix
  ];
}

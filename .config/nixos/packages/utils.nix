{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    tree-sitter

    llama-cpp
    syncthing

    direnv
    nix-direnv
    carapace
    starship
    atuin
    zoxide

    unzip
    xz
    gzip
    stow
    libnotify
    wl-clipboard
    clipse

    hyperfine

    grimblast
    wf-recorder

    tokei
    kondo
    fzf
    delta

    ffmpeg
    imagemagick

    tinyproxy

    libqalculate

    nh
    nix-tree

    harper

    cachix

    yt-dlp

    gocryptfs

    libwebp
  ];
}

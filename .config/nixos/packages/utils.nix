{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    llama-cpp
    syncthing

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

    gocryptfs

    libwebp
  ];
}

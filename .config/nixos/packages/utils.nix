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
    fyi
    wl-clipboard
    clipse

    hyperfine

    grimblast

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

{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bat
    ripgrep
    fd
    curl
    dust
    bottom
    dufs
    tealdeer
    eza
    gen-license

    nushell

    yazi
  ];
}

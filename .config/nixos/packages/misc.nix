{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    chafa
    ngrrram
    renderdoc
    presenterm
    resvg
    microfetch
    fastfetch
    wiki-tui
    timer
    fwup
    jq
  ];
}

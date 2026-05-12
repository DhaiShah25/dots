{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    chafa
    zoxide
    ngrrram
    renderdoc
    presenterm
    resvg
    microfetch
    wiki-tui
    timer
    fwup
    jq
  ];
}

{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    chafa
    ngrrram
    renderdoc
    presenterm
    resvg
    microfetch
    fastfetch
    timer
    fwup
    jq
    slurp
  ];
}

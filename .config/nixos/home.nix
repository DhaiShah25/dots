{pkgs, ...}: {
  home.stateVersion = "25.05";

  services.syncthing.enable = true;
  services.ollama.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    "nv" = "nvim";
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.frappeDark;
    name = "Catppuccin Frappe Dark";
    size = 20;
    hyprcursor.enable = true;
    hyprcursor.size = 20;
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableNushellIntegration = true;
    };

    nushell = {
      enable = true;
      settings = {
        show_banner = false;
        completions.external = {
          enable = true;
          max_results = 200;
        };
        history = {
          file_format = "sqlite";
          max_size = 10000;
          isolation = false;
        };
      };
      extraConfig = ''
        $env.PATH ++= ['/usr/bin/env', '~/.local/bin']
        $env.EDITOR = "nvim";

        microfetch
      '';
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    starship = {
      enable = true;
      enableNushellIntegration = true;
    };

    fzf = {
      enable = true;
    };
  };
}

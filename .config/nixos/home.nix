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

  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };

    zsh = {
      enable = true;
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
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
    };
  };
}

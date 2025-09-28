{
  config,
  pkgs,
  ...
}: {
  imports = [<home-manager/nixos>];

  users.users.gale = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    packages = with pkgs; [];
    shell = pkgs.nushell;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.users.gale = {pkgs, ...}: {
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
      theme = {
        name = "Nordic";
        package = pkgs.nordic;
      };
      iconTheme = {
        name = "Nordzy";
        package = pkgs.nordzy-icon-theme;
      };
    };

    qt = {
      enable = true;
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
        enableCompletion = true;

        antidote = {
          enable = true;
          plugins = [
            "zsh-users/zsh-autosuggestions"
          ];
        };

        history = {
          ignoreDups = true;
          ignoreSpace = true;
          saveNoDups = true;
          share = true;
        };

        syntaxHighlighting.enable = true;

        initContent = ''
          export PATH="/home/gale/.bun/bin:$PATH"
        '';
      };

      nushell = {
        enable = true;
        extraConfig = ''
          $env.config.show_banner = false

          $env.PATH = ($env.PATH |
          split row (char esep) |
          append /usr/bin/env
          )

          $env.config.history = {
            file_format: sqlite
            max_size: 1_000_000
            sync_on_enter: true
            isolation: false
          }

          $env.PATH ++= ['~/.local/bin']
          $env.EDITOR = "nvim";

          let carapace_completer = {|spans|
              let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)
              let spans = (if $expanded_alias != null {
                $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
              } else {
                $spans | skip 1 | prepend ($spans.0)
              })
              carapace $spans.0 nushell ...$spans | from json
          }

          $env.config.completions = {
              external: {
                enable: true
                completer: $carapace_completer
              }
          }
        '';
      };

      carapace = {
        enable = true;
        enableNushellIntegration = true;
        enableZshIntegration = true;
      };

      starship = {
        enable = true;
        enableNushellIntegration = true;
        enableZshIntegration = true;
      };

      skim = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}

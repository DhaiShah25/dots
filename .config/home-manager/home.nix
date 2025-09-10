{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gale";
  home.homeDirectory = "/home/gale";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    cbonsai
    mitmproxy
    tinyproxy
    jujutsu
    typst
    pandoc
    oha
    zoxide
    oterm
    wlsunset
    chezmoi
    gen-license
    butler
    renderdoc
    matugen
    ffmpeg
    xorg.xprop
    pnpm
    nodejs
    taplo
    grimblast
    tealdeer
    kondo
    typescript-language-server
    emmet-language-server
    ruff
    stylua
    prettierd
    presenterm
    resvg
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/gale/etc/profile.d/hm-session-vars.sh
  #
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
      nix-direnv.enable = true; # this is optional, see https://github.com/nix-community/nix-direnv
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
        eval "$(starship init zsh)"
        export PATH="/home/gale/.bun/bin:$PATH"
      '';
    };

    nushell = {
      enable = true;
      extraConfig = ''
        $env.config.show_banner = false
        $env.config.edit_mode = "vi"

        $env.PATH = ($env.PATH |
        split row (char esep) |
        append /usr/bin/env
        )

        $env.config.history = {
          file_format: sqlite
          max_size: 1_000_000
          sync_on_enter: true
          isolation: true
        }

        $env.PATH ++= ['~/.local/bin']
        $env.EDITOR = "nvim";
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
  };

  services.syncthing.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

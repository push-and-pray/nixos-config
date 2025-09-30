{
  hostname,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  time.timeZone = "Europe/Copenhagen";

  networking.hostName = "${hostname}";

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  users.users.julius = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "docker"
    ];
    hashedPassword = "$6$NFybOOj2fgSavlzj$mfDprTefkFxZYS4yjxgw0QNh0cU3S0QaUhURGucVwfJ7tydVgVC9cvb9CH0kN0zxu98H4g2dm4Xg3hVDrH5pD1";
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users.julius = import ./home.nix;
  };

  system.stateVersion = "24.05";

  wsl = {
    enable = true;
    defaultUser = "julius";
    useWindowsDriver = true;
    wslConf.network.generateHosts = false;
  };

  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      mesa
      libvdpau-va-gl
      vaapiVdpau
    ];
  };

  virtualisation.docker = {
    package = pkgs.unstable.docker;
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  nix = {
    settings = {
      trusted-users = ["julius"];

      accept-flake-config = true;
      auto-optimise-store = true;
    };

    registry = {
      nixpkgs = {
        flake = inputs.nixpkgs;
      };
      unstable = {
        flake = inputs.nixpkgs-unstable;
      };
    };

    nixPath = [
      "nixpkgs=${inputs.nixpkgs.outPath}"
      "nixos-config=/etc/nixos/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];

    extraOptions = ''experimental-features = nix-command flakes'';

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.overlays = [outputs.overlays.unstable-packages];
  nixpkgs.config.allowUnfree = true;
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    image = ../../res/bg.png;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}

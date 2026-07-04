{config, pkgs, pkgsUnstable, inputs, ...}:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    auto-cpufreq
    git
    github-cli
    mattermost-desktop
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    obsidian
    slack
   	tre-command
   	zed-editor
   	zotero
   	zoxide
   	#wget

    # niri dependencies
    niri
   	dms-shell
   	fuzzel
   	swaylock
   	mako
   	swayidle
   	tuigreet
   	quickshell
    hypridle
    hyprlock

    # console
   	kitty
  ];
}

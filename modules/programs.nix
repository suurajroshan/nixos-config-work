{config, pkgs, inputs, lib, ...}:

{
 	programs.neovim = {
		enable=true;
 	      defaultEditor=true;
 	};
 	programs.niri.enable = true;
	programs.waybar.enable = lib.mkForce false;
 	# Install firefox.
 	programs.firefox.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

}

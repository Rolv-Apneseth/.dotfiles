{ inputs, configLib, ... }:
{
  imports = [ ./hardware.nix ];

  networking.hostName = "horus";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}

{ inputs, ... }:
let
  secretspath = builtins.toString inputs.secrets;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = "${secretspath}/secrets.yaml";
    defaultSopsFormat = "yaml";
    validateSopsFiles = true;

    age = {
      sshKeyPaths = [ /etc/ssh/ssh_host_ed25519_key ];
      keyFile = /home/rolv/.config/sops/age/keys.txt;
      generateKey = true;
    };

    # secrets copied to /run/secrets
    secrets = {
      githubPassword = {
        owner = "rolv";
        mode = "0440";
      };
    };
  };
}

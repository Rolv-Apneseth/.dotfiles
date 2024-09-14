{
  inputs,
  config,
  configVars,
  ...
}:
let
  secretspath = builtins.toString inputs.secrets;
  user = configVars.username;
  home = "/home/${user}";
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = "${secretspath}/secrets.yaml";
    defaultSopsFormat = "yaml";
    validateSopsFiles = true;

    age = {
      # automatically import main SSH key for the age key
      sshKeyPaths = [ "${home}/.ssh/id_main" ];
    };

    # secrets copied to /run/secrets
    secrets = {
      main_email = {
        owner = user;
        inherit (config.users.users.${user}) group;
      };
      work_email = {
        owner = user;
        inherit (config.users.users.${user}) group;
      };

      # Setup age key, so editing secrets with `sops secrets.yaml` works
      "keys/main/age" = {
        owner = user;
        inherit (config.users.users.${user}) group;
        path = "/home/${configVars.username}/.config/sops/age/keys.txt";
      };

      # Setup SSH keys
      # "keys/main/private" = {
      # owner = configVars.username;
      # path = "/home/${configVars.username}/.ssh/id_main";
      # };
    };
  };
}

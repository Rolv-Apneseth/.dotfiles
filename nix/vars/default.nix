{ inputs, lib }:
{
  username = "rolv";
  full_name = "Rolv Apneseth";
  git_username = "Rolv-Apneseth";
  git_email = "rolv.apneseth@gmail.com";
  main_email = inputs.secrets.mainEmail;
  work_email = inputs.secrets.workEmail;
}

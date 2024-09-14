{ config, pkgs, ... }: 
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
  ];

  # Enable experimental features for Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the OpenSSH service
  services.openssh.enable = true;

  # SSH settings
  services.openssh.settings = {
    PermitRootLogin = false;             # Disable root login over SSH
    PasswordAuthentication = false;      # Disable password-based logins
    PubkeyAuthentication = true;       # Enable public key authentication
  };

  users.users.martin = {
    isNormalUser = true;   # Marks this user as a normal (non-system) user
    home = "/home/martin"; # Home directory for the user
    shell = pkgs.bash;     # Default shell for the user

    # Set the group for the user
    group = "martin";      # You can set the group name the same as the username

    # Add the user to the necessary groups (optional)
    extraGroups = [ "wheel" ];  # Allows the user to use sudo (optional)

    # Authorized SSH key for this user
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDTP3jb+guX80fBpSe06mEhdFte9JjcWbxC9OFfwVqFxCc67rUmGgEUspQZKpTpzJtI/y7Z8tEUi2KVHAk0xnGRCS0L/VusxdqObL1d8lfwjlZT/Ur49ob0CIYSDbJF71uE+qMHY9DD2cqX+Bj1tXAI8mZHkmjJo9aCCMRb7jTehdpB9auQsyNm9TE3/z6flZW/FAKA/uwsW+0vEOO2TJzBST5+1udGJG2dCBEg6eV9D0GjnpuQwQlaBugVmqN6XNYJYHIJI7Sk4qFchsynyBI0FBnF/hCUwir2ABJbNgtHnJsmqm71jbMpgTtZjsZjTaR9P7s+qNg6MuXaVFgRHf5LXF+V1ALGv+aD9xKxuxZssf/OSgmm9SGBEbgsqchdAN3JCo53TUJuz8tj1L90yLCQkASnvhDthaBqOexOMqakFBH0I7ebST1Ws0Co/zkSfmiLly2hd8r9TBvoQDwLpZ9KeVFy0TYsjM+E6llzGbH1CgYsawQjx9N7oLsutiXCJHF3iYPTnWDV2SJiY9UyzPrJmsnZflDKxsMGUiZwgvVKhpV0VSXm0EgWNb/LncndQh3BL2MWuUpEBXl/TaV1Ls65b+c9N+myBa54B0CqI6GSmnoxV0clmFLLZjfTaPWL+XWvXIbGoWc0pdtnevW18XJ7KRaeX7nRdl4HYrkpFpdj2Q== eidemartin_303@hotmail.com"  # Replace with your actual public SSH key
    ];
  };

  # Define the group for the user
  users.groups.martin = {};
}

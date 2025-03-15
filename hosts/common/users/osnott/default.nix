{
  pkgs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.users.osnott = {
    isNormalUser = true;
    shell = pkgs.zsh;

    extraGroups = ifTheyExist [
      "wheel"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTmMtIBs4oWgRMBzM+L6M3H9P6nUngMFok0qvhzzeFyWMn7UbnamnquxnppE65kUF+xvj4dIT0qrpVCoC2GqCiwIrYHCTbR0wuVlp1lq8BnGsVGfpCaQFjLZQXWfOP5LW3gD4BUgTyYJ8GtZtn2TO1ewhtkHebWeunIv2LKsNYe4StkplhWC2Ym1ds9XcE55gkDV866ROfX6D8ZWmCiJFi1yE7nTp9qRRl6K+ABSW65Pkx1q4pYmzjJF+Q7d5UZzL1S4YhfeTCn5XflHmzQZRtFtAVxIjDfvnV7vjy7dGdUJWcngO0XjJ9UC2UxUUMvYe41clmjX2ytmHeck0lUl4Mp3+porm8cLPD0oKuFov2FwQWPaqcfZkogW66JKgRyX17ttcZQqFXUs2f3wHN2hzYyVCMqmrStP8xAd5s9UcfxiVnF6DzDErLSCMv+x8Pi5SeGANsOYAkOOFQ/mrQumZ+QhXxxx96hiGZGjNIKw9rlr3oq+KrntBgA/ITKHA8rFU= osnott@ramen"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILPqhYYTBp7z9qjaALIwgSUC3vb+ZbpQ9AH/nVUqT+YV"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPFBHp+VnqnPzkFZd0UbkQ9yxbwIRNA64HC4rRcD8IrT"
    ];

    packages = [pkgs.home-manager];
  };

  home-manager.users.osnott = import ../../../../home/osnott/${config.networking.hostName}.nix;
}

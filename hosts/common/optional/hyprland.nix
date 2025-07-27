{config, ...}: {
  programs.hyprland.enable = true;

  # Hint electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}

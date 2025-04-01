# https://github.com/srid/nixos-config/blob/master/modules/home/all/tmux.nix
{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.tmux-which-key
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.catppuccin
      tmuxPlugins.yank
      tmuxPlugins.sensible
    ];

    shortcut = "a";

    escapeTime = 50;

    baseIndex = 1;

    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      set-option -g mouse on

      set -g @catppuccin_flavour 'mocha'
      set -g @catppuccin_window_status_style "rounded"

      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_application}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_uptime}"

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';
  };
}

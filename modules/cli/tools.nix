{pkgs, ...}: {
  home.packages = [
    pkgs.alejandra
    pkgs.deadnix
    pkgs.htop
    pkgs.statix
    pkgs.tmux
  ];

  home.file.".tmux.conf".text = ''
    set -g mouse on
    set -g history-limit 100000
    set -g default-terminal "tmux-256color"
    set -ga terminal-overrides ",xterm-256color:Tc"

    set -g base-index 1
    setw -g pane-base-index 1
    set -g renumber-windows on

    bind | split-window -h
    bind - split-window -v
    unbind '"'
    unbind %

    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R

    setw -g mode-keys vi
    set -g status-style "bg=default"
  '';
}

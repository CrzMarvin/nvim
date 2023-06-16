# tmux

[nord color](https://www.nordtheme.com/docs/ports/tmux/installation)
[cheat sheet](https://tmuxcheatsheet.com/)
- [x] [tmux gruvbox](https://github.com/LawAbidingCactus/tmux-gruvbox-truecolor)

[tpm tmux plugin manager](https://github.com/tmux-plugins/tpm)
`prefix + I` (大写i)

| code                  | name                | shortcut   |
| --------------------- | ------------------- | ---------- |
| `tmux new -s Name`    | add new session     |          |
| `tmux ls`             | show all sessions   | prefix + s |
| `tmux attach -t Name` | attach session      |            |
| `tmux detach`         | detach from session | prefix + d |

***reload config***: prefix + r
***source config:*** prefix + r
add winodw: prefix + c
switch to nex window: prefix + n
switch to previou window: prefix + p
switch to window:  prefix + ${window number}
see all windows: prefix + wtmu
nav from panes: Ctl + hjkl
resize panel: prefix + hjkl
max or min pane: prefix + m
add session: `:new `
rename window: `prefix + ,`
**quit pane or window: exit**

about copy mode
1.  Add setw -g mode-keys vi in your tmux config.
2.  Ctrl + \[ to enter tmux vi copy mode.
3.  Move around with vim navigation keys.
4.  Begin highlight with Space.
5.  Copy with Enter or y
6.  Paste with Ctrl + \]


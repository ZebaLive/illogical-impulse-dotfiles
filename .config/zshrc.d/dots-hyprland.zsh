# Use the generated color scheme

if [ -z "$VSCODE_INJECTION" ] && [ -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt ]; then
    command cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
fi

# Use the generated color scheme

if [ -z "$VSCODE_INJECTION" ] && [ -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt ]; then
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
fi

#!/usr/bin/env bash
# Development-mode deployment: symlink dots/.config/<x> -> ~/.config/<x>
# so edits inside the repo are reflected immediately, with no copy step.

deploy_dots_symlink() {
    log_info "Linking dots/.config/* -> ~/.config/* (development mode)"
    mkdir -p "$HOME/.config"

    local name src dst
    for src in "$DOTS_DIR/.config"/*/; do
        name="$(basename "$src")"
        dst="$HOME/.config/$name"
        src="${src%/}"

        if [ -L "$dst" ] && [ "$(readlink -f "$dst")" = "$(readlink -f "$src")" ]; then
            log_info "$name already linked, skipping"
            continue
        fi

        ln -sfn "$src" "$dst"
        log_ok "Linked $name -> $src"
    done
}

#!/usr/bin/env bash
# Normal-mode deployment: copy dots/.config/<x> into ~/.config/<x>.
# Uses rsync so re-running is idempotent (only changed files touched)
# and existing unrelated files in the target dir are left alone.

deploy_dots_copy() {
    log_info "Copying dots/.config/* -> ~/.config/* (normal install)"
    require_cmd rsync "pacman -S rsync" || return 1
    mkdir -p "$HOME/.config"

    local name src dst
    for src in "$DOTS_DIR/.config"/*/; do
        name="$(basename "$src")"
        dst="$HOME/.config/$name"
        mkdir -p "$dst"
        rsync -a --info=name1 "$src" "$dst/" >> "$LOG_FILE" 2>&1
        log_ok "Deployed $name -> $dst"
    done
}

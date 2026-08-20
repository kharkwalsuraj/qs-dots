#!/usr/bin/env bash
# Detects existing user configuration and backs it up before touching it.
# Never overwrites blindly, and is a no-op if a target already correctly
# symlinks/points into this repo (keeps repeated installs idempotent).

BACKUP_ROOT="$HOME/.config-backup/$(date '+%Y%m%d-%H%M%S')"

# every top-level dir we ship under dots/.config/
_dots_targets() {
    find "$DOTS_DIR/.config" -mindepth 1 -maxdepth 1 -type d -printf '%f\n'
}

backup_existing_configs() {
    local any=0
    for name in $(_dots_targets); do
        local target="$HOME/.config/$name"

        if [ -L "$target" ]; then
            local dest
            dest="$(readlink -f "$target")"
            if [ "$dest" = "$(readlink -f "$DOTS_DIR/.config/$name")" ]; then
                log_info "$name already symlinked to this repo, nothing to back up"
                continue
            fi
            log_warn "$name is a symlink pointing elsewhere ($dest) - backing up the link"
        fi

        if [ -e "$target" ] || [ -L "$target" ]; then
            [ "$any" -eq 0 ] && mkdir -p "$BACKUP_ROOT" && any=1
            log_info "Backing up existing ~/.config/$name -> $BACKUP_ROOT/$name"
            mv "$target" "$BACKUP_ROOT/$name"
        fi
    done

    if [ "$any" -eq 1 ]; then
        log_ok "Existing configs backed up to $BACKUP_ROOT"
    else
        log_info "No conflicting existing configs found"
    fi
}


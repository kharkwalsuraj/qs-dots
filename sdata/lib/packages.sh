#!/usr/bin/env bash
# Package installation. Reads plain-text package lists so the set of
# packages can be edited without touching any shell logic.
#
#   install/packages/pacman.txt   - official repo packages (pacman -S)
#   install/packages/aur.txt      - AUR packages (needs an AUR helper)
#   install/packages/fonts.txt    - font packages, installed alongside pacman list

_read_list() {
    # strips blank lines and comments from a package list file
    local file="$1"
    [ -f "$file" ] || return 0
    grep -vE '^\s*(#|$)' "$file"
}

_detect_aur_helper() {
    for helper in paru yay; do
        if command -v "$helper" >/dev/null 2>&1; then
            echo "$helper"
            return 0
        fi
    done
    return 1
}

install_packages() {
    log_info "Resolving package lists..."
    require_cmd pacman "this installer targets Arch Linux" || return 1

    local pacman_pkgs font_pkgs aur_pkgs
    pacman_pkgs="$(_read_list "$PACKAGES_DIR/pacman.txt")"
    font_pkgs="$(_read_list "$PACKAGES_DIR/fonts.txt")"
    aur_pkgs="$(_read_list "$PACKAGES_DIR/aur.txt")"

    if [ -n "$pacman_pkgs$font_pkgs" ]; then
        log_info "Installing official packages (pacman)..."
        # --needed makes this idempotent: already-installed packages are skipped
        sudo pacman -S --needed --noconfirm $pacman_pkgs $font_pkgs \
            || { log_error "pacman package install failed"; return 1; }
        log_ok "Official packages installed"
    fi

    if [ -n "$aur_pkgs" ]; then
        local helper
        if helper="$(_detect_aur_helper)"; then
            log_info "Installing AUR packages via $helper..."
            "$helper" -S --needed --noconfirm $aur_pkgs \
                || { log_error "AUR package install failed"; return 1; }
            log_ok "AUR packages installed"
        else
            log_warn "No AUR helper (paru/yay) found - skipping AUR packages: $aur_pkgs"
            log_warn "Install an AUR helper and re-run, or install these manually."
        fi
    fi
}

#!/usr/bin/env bash
# Post-install steps common to both Normal and Development installs:
# enabling services, seeding default user settings, permission fixes.

_enable_services() {
    echo "→ Enabling essential system services..."
    # Network
    sudo systemctl enable --now NetworkManager
    # Bluetooth
    sudo systemctl enable --now bluetooth
    # Audio (PipeWire)
    systemctl --user enable --now pipewire.service
    systemctl --user enable --now pipewire-pulse.service
    systemctl --user enable --now wireplumber.service

    echo "✓ Essential services enabled"
}

_darkly_gtk () {
  git clone https://github.com/wrymt/darkly-gtk.git /tmp/
  /tmp/darkly-gtk/install.sh -l
}

run_post_install() {
    log_info "Running post-install steps..."
    _darkly_gtk
    # _enable_services
    # chmod +x "$REPO_ROOT"/scripts/*.sh 2>/dev/null || true
    log_ok "Post-install complete"
}

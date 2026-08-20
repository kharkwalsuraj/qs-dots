#!/usr/bin/env bash
# Post-install steps common to both Normal and Development installs:
# enabling services, seeding default user settings, permission fixes.

_enable_services() {
    # Idempotent: `enable` is a no-op if already enabled.
    if command -v systemctl >/dev/null 2>&1; then
        for svc in pipewire pipewire-pulse wireplumber; do
            systemctl --user enable "$svc" >> "$LOG_FILE" 2>&1 || \
                log_warn "Could not enable $svc (continuing)"
        done
        log_ok "Audio services enabled (user systemd)"
    fi
}

run_post_install() {
    log_info "Running post-install steps..."
    # _enable_services
    # chmod +x "$REPO_ROOT"/scripts/*.sh 2>/dev/null || true
    log_ok "Post-install complete"
}

#!/usr/bin/env bash
# Logging helpers shared by every sdata/lib/*.sh module.
# Every function writes to stdout (for the user) AND $LOG_FILE (for debugging).

_ts() { date '+%Y-%m-%d %H:%M:%S'; }

log_info()  { local m="[$(_ts)] [INFO]  $*";  echo -e "  \033[36m::\033[0m $*"; echo "$m" >> "$LOG_FILE"; }
log_warn()  { local m="[$(_ts)] [WARN]  $*";  echo -e "  \033[33m!!\033[0m $*"; echo "$m" >> "$LOG_FILE"; }
log_error() { local m="[$(_ts)] [ERROR] $*";  echo -e "  \033[31mxx\033[0m $*" >&2; echo "$m" >> "$LOG_FILE"; }
log_ok()    { local m="[$(_ts)] [OK]    $*";  echo -e "  \033[32m✓\033[0m $*"; echo "$m" >> "$LOG_FILE"; }

# require_cmd <cmd> [install-hint]
require_cmd() {
    if ! command -v "$1" >/dev/null 2>&1; then
        log_error "Missing required command: $1 ${2:+($2)}"
        return 1
    fi
}

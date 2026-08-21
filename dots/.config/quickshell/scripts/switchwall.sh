#!/usr/bin/env bash

IMAGE=""
MODE=""
SCHEME="tonal-spot"

set_mode() {
    case "$MODE" in
        light)
            echo "Setting theme to light mode..."
            gsettings set org.gnome.desktop.interface gtk-theme "Darkly"
            gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
            ;;

        dark)
            echo "Setting theme to dark mode..."
            gsettings set org.gnome.desktop.interface gtk-theme "Darkly"
            gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
            ;;

        *)
            echo "Error: invalid mode: $MODE"
            echo "Valid modes: light, dark"
            return 1
            ;;
    esac
}

generate_colors() {
    if [[ -z "$IMAGE" ]]; then
        echo "Error: no wallpaper specified."
        return 1
    fi

    echo "Setting wallpaper and generating material colors..."

    matugen image "$IMAGE" \
        -m "$MODE" \
        -t "$SCHEME"
}

main() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --image|-i)
                IMAGE="$2"
                shift 2
                ;;

            --mode|-m)
                MODE="$2"
                shift 2
                ;;

            --scheme|-s)
                SCHEME="$2"
                shift 2
                ;;

            --help|-h)
                echo "Usage: $0 [OPTIONS]"
                echo
                echo "Options:"
                echo "  -i, --image <path>        Set wallpaper"
                echo "  -m, --mode <light|dark>   Set System mode"
                echo "  -s, --scheme <scheme>     Material color scheme"
                echo "  -h, --help                Show this help"
                exit 0
                ;;

            *)
                echo "Unknown option: $1"
                exit 1
                ;;
        esac
    done

    [[ -n "$IMAGE" ]] && generate_colors
    [[ -n "$MODE" ]] && set_mode
}

main "$@"

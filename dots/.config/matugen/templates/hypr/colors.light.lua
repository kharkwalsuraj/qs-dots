hl.config({
    general = {
        col = {
            active_border   = "rgba({{colors.outline_variant.light.hex_stripped}}77)",
            inactive_border = "rgba({{colors.surface_container_low.light.hex_stripped}}33)",
        },
    },
    misc = {
        background_color = "rgba({{colors.surface.light.hex_stripped}}FF)",
    },
})

hl.window_rule({
    match        = { pin = 1 },
    border_color = "rgba({{colors.primary.light.hex_stripped}}AA) rgba({{colors.primary.light.hex_stripped}}77)",
})

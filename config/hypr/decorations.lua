-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        border_size = 3,

        gaps_in  = 8,
        gaps_out = 20,

        col = {
            active_border   = { colors = {"rgba(ccccccff)", "rgba(555555ff)"}, angle = "90"},
            inactive_border = "rgba(55555588)",
        },
    },

    decoration = {
        rounding       = 2,
        rounding_power = 7,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 40,
            render_power = 3,
            color        = 0xcc0c0c0c,
        },

        blur = {
            enabled   = true,
            size      = 10,
            passes    = 3,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})



-- Beziers
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
-- Springs
hl.curve("fast",   { type = "spring", mass = 1, stiffness = 900, dampening = 55})
hl.curve("smooth", { type = "spring", mass = 1, stiffness = 700, dampening = 50})

-- Animations
hl.animation({ leaf = "global",           enabled = true,  speed = 10,  bezier = "default" })

hl.animation({ leaf = "windows",          enabled = true,  speed = 1,   spring = "fast" })
hl.animation({ leaf = "windowsIn",        enabled = true,  speed = 1,   spring = "fast", style = "popin 75%" })
hl.animation({ leaf = "windowsOut",       enabled = true,  speed = 1,   spring = "fast", style = "popin 75%" })

hl.animation({ leaf = "layers",           enabled = true,  speed = 3.8, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",         enabled = true,  speed = 4,   bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true,  speed = 1.5, bezier = "almostLinear", style = "fade" })

hl.animation({ leaf = "fade",             enabled = true,  speed = 3,   bezier = "quick" })
hl.animation({ leaf = "fadeIn",           enabled = true,  speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",          enabled = true,  speed = 1,   bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true,  speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true,  speed = 1,   bezier = "almostLinear" })

hl.animation({ leaf = "border",           enabled = true,  speed = 2,   bezier = "quick" })

hl.animation({ leaf = "workspaces",       enabled = true,  speed = 1,   spring = "smooth", style = "slidefade" })
hl.animation({ leaf = "specialWorkspace", enabled = true,  speed = 1,   spring = "smooth", style = "slidefadevert" })

hl.animation({ leaf = "zoomFactor",       enabled = true,  speed = 7,   bezier = "quick" })
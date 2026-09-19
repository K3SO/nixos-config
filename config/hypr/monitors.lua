-- Main
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@143.98Hz",
    scale    = "1",
    position = "0x0",
})

-- Built in
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@144.00Hz",
    scale    = "1",
    position = "-1920x0",
})

-- Workspaces 1 to 5 on main monitor
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1", persistent = true })

-- Workspaces 6 to 10 on second monitor
hl.workspace_rule({ workspace = "6", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "7", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "8", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "9", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "10", monitor = "eDP-1", persistent = true })
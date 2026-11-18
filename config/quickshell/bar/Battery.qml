pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property int batteryLevelRaw: 0
    property string batteryLevel: "0%"
    property string batteryIcon: "󰂎"
    property bool batteryCharging: false

    Process {
        id: batteryProc
        command: ["sh", "-c", "printf '%s\\n%s' \"$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null || echo '99')\" \"$(cat /sys/class/power_supply/BAT*/status 2>/dev/null || echo 'Discharging')\""]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const lines = text.trim().split("\n")
                const level = parseInt(lines[0]) || 0
                const status = (lines[1] || "Discharging").trim()

                root.batteryLevelRaw = level
                root.batteryLevel = level + "%"
                root.batteryCharging = status === "Charging"

                if (root.batteryCharging) root.batteryIcon = ""
                else if (level >= 90) root.batteryIcon = "󰁹"
                else if (level >= 80) root.batteryIcon = "󰂂"
                else if (level >= 70) root.batteryIcon = "󰂁"
                else if (level >= 60) root.batteryIcon = "󰂀"
                else if (level >= 50) root.batteryIcon = "󰁿"
                else if (level >= 40) root.batteryIcon = "󰁾"
                else if (level >= 30) root.batteryIcon = "󰁽"
                else if (level >= 20) root.batteryIcon = "󰁼"
                else if (level >= 10) root.batteryIcon = "󰁻"
                else root.batteryIcon = "󰁺"
            }
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: batteryProc.running = true
    }
}
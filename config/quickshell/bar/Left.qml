import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    spacing: 8

    Repeater {
        model: 10

        Text {
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
            text: index + 1
            color: isActive ? "#ffffff" : (ws ? "#777777" : "#333333")
            font.family: root.font
        }
    }
}
import Quickshell
import QtQuick
import QtQuick.Layouts

RowLayout {
    spacing: 8

    RowLayout {
        spacing: 3
        Text {
            text: Volume.volumeIcon
            color: root.theme.text
            font.family: root.font
        }
        Text {
            text: Volume.volume
            color: root.theme.text
            font.family: root.font
        }
    }

    RowLayout {
        spacing: 3
        Text {
            text: Battery.batteryIcon
            color: root.theme.text
            font.family: root.font
        }
        Text {
            text: Battery.batteryLevel
            color: root.theme.text
            font.family: root.font
        }
    }

    RowLayout {
        Text {
            anchors.centerIn: parent
            text: Time.timeString
            color: root.theme.text
            font.family: root.font
        }
    }
}
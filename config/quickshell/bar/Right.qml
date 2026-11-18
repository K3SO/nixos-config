import Quickshell
import QtQuick
import QtQuick.Layouts

RowLayout {
    spacing: 8

    RowLayout {
        spacing: 3
        Text {
            text: Volume.volumeIcon
            color: "#ffffff"
            font.family: root.font
        }
        Text {
            text: Volume.volume
            color: "#ffffff"
            font.family: root.font
        }
    }

    RowLayout {
        spacing: 3
        Text {
            text: Battery.batteryIcon
            color: "#ffffff"
            font.family: root.font
        }
        Text {
            text: Battery.batteryLevel
            color: "#ffffff"
            font.family: root.font
        }
    }

    RowLayout {
        Text {
            anchors.centerIn: parent
            text: Time.timeString
            color: "#ffffff"
            font.family: root.font
        }
    }
}
import Quickshell
import QtQuick

// Not needed rn
// import QtQuick.Layouts
// import Quickshell.Widgets
// import Quickshell.Services.SystemTray
// import Quickshell.Io
// import Quickshell.Services.Mpris

Scope {
    id: root
    property string font: "JetBrainsMono NF"
    property var theme: DefaultTheme {}

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            color: "#00000000"
            
            Rectangle {
                anchors {
                    fill: parent
                }
                radius: 0

                color: "#88555555"

                Rectangle {
                    anchors {
                        fill: parent
                        bottomMargin: 1
                    }

                    color: root.theme.bg

                    Left {
                        anchors {
                            left: parent.left
                            verticalCenter: parent.verticalCenter
                            leftMargin: 10
                        }
                    }

                    Right {
                        anchors {
                            right: parent.right
                            verticalCenter: parent.verticalCenter
                            rightMargin: 10
                        }
                    }
                }
            }
        }
    }
}
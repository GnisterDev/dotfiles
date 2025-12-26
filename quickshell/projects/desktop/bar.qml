import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

// import "../modules"
// import "../styles"

Rectangle {
    id: bar
    property var screen

    color: colors.background
    border.color: colors.border
    border.width: 1

    RowLayout {
        anchors.fill: parent
        anchors.margins: 6
        spacing: 12

        // Left side - Workspace indicator
        Workspace {
            Layout.alignment: Qt.AlignLeft
        }

        // Center - Window title
        Item {
            Layout.fillWidth: true

            Text {
                id: windowTitle
                anchors.centerIn: parent
                text: HyprlandFocusedMonitor.activeWindow?.title ?? "Desktop"
                color: colors.text
                font: fonts.regular
                elide: Text.ElideRight

                Behavior on text {
                    PropertyAnimation {
                        duration: 200
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }

        // Right side - System indicators
        RowLayout {
            Layout.alignment: Qt.AlignRight
            spacing: 8

            NetworkIndicator {}

            VolumeIndicator {}

            BatteryIndicator {}

            SystemTray {}

            Clock {}
        }
    }

    // Subtle gradient overlay
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: Qt.rgba(1, 1, 1, 0.05)
            }
            GradientStop {
                position: 1.0
                color: Qt.rgba(0, 0, 0, 0.05)
            }
        }
    }
}

pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Hyprland

Row {
    id: workspaceBar

    spacing: 10

    anchors.verticalCenter: parent.verticalCenter

    readonly property var workspaces: Hyprland.workspaces

    Repeater {
        model: 7

        delegate: Rectangle {
            required property int index

            anchors.verticalCenter: parent.verticalCenter

            height: 15
            width: index == Hyprland.focusedWorkspace.id - 1 ? 25 : 15

            radius: 10

            color: index == Hyprland.focusedWorkspace.id - 1 ? "#7287fd" : "#babbf1"

            Behavior on width {
                NumberAnimation {
                    duration: 250
                    easing.type: Easing.OutQuint
                }
            }
        }
    }
}

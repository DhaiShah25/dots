pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    id: workspaceBar

    readonly property var workspaces: Hyprland.workspaces

    height: 30
    width: childrenRect.width

    Repeater {
        model: parent.workspaces.values

        delegate: Rectangle {
            id: wsItem

            height: 30
            width: 30

            color: modelData.focused ? "#393552" : "#00000000"

            radius: 10

            required property HyprlandWorkspace modelData
            Text {
                anchors.centerIn: parent
                text: parent.modelData.name
                font.pixelSize: 20
                font.family: "MonaspiceKr NFP"
                color: "#e0def4"
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    parent.modelData.activate();
                }
            }
        }
    }
}

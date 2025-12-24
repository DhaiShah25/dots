pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

Row {
    height: 30
    width: childrenRect.width

    spacing: 10

    Repeater {
        model: SystemTray.items
        delegate: Rectangle {
            required property SystemTrayItem modelData

            color: "transparent"

            implicitWidth: 20
            implicitHeight: 20

            anchors.verticalCenter: parent.verticalCenter

            IconImage {
                source: parent.modelData.icon
                implicitSize: 20.0
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: mouse => {
                    if (!parent.modelData.onlyMenu && mouse.button === Qt.LeftButton) {
                        parent.modelData.activate();
                    } else {
                        parent.modelData.display(bar, parent.parent.parent.x, parent.parent.parent.y + 40);
                    }
                }
            }
        }
    }
}

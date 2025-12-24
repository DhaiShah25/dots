import QtQuick
import Quickshell
import QtQuick.Controls
import QtQuick.Layouts
import "panel"

PopupWindow {
    id: root
    required property bool isVisible
    visible: isVisible

    anchor.edges: Edges.Top
    anchor.gravity: Edges.Bottom
    anchor.item: parent
    anchor.margins.top: 40

    color: "#303446"
    implicitHeight: 450
    implicitWidth: 650

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        StackLayout {
            id: mainStack
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: panelTab.currentIndex

            Dash {}
            Mpris {}
            Notif {}
        }

        TabBar {
            id: panelTab
            Layout.fillWidth: true
            implicitHeight: 25

            background: Rectangle {
                color: "transparent"
            }

            Repeater {
                model: [
                    {
                        icon: "",
                        index: 0
                    },
                    {
                        icon: "",
                        index: 1
                    },
                    {
                        icon: "",
                        index: 2
                    }
                ]

                delegate: TabButton {
                    id: control
                    implicitHeight: 25

                    background: Rectangle {
                        color: control.checked ? "#949cbb" : "#737994"
                    }

                    contentItem: Text {
                        text: modelData.icon
                        font.bold: true
                        font.pixelSize: 20
                        color: "white"
                        font.family: "MonaspiceKr NFP"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
}

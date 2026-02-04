import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

import "bar"

Scope {
    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            id: bar
            required property var modelData

            screen: modelData
            color: "transparent"

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                top: 3
                bottom: 3
                right: 3
                left: 3
            }

            implicitHeight: 30

            RowLayout {
                anchors.fill: parent
                spacing: 0

                WrapperRectangle {
                    implicitHeight: 30
                    color: ThemeConsts.backgroundColor
                    margin: 5
                    radius: ThemeConsts.radius
                    Layout.alignment: Qt.AlignLeft
                    border.color: "#8caaee"
                    border.width: 1
                    ClockWidget {}
                }

                Item {
                    Layout.fillWidth: true
                }

                WrapperRectangle {
                    color: ThemeConsts.backgroundColor
                    margin: 5
                    radius: ThemeConsts.radius
                    implicitHeight: 30

                    border.color: "#8caaee"
                    border.width: 1

                    Layout.alignment: Qt.AlignCenter

                    Workspaces {}
                }

                Item {
                    Layout.fillWidth: true
                }

                WrapperRectangle {
                    color: ThemeConsts.backgroundColor
                    margin: 5
                    radius: ThemeConsts.radius
                    implicitHeight: 30

                    border.color: "#8caaee"
                    border.width: 1

                    Layout.alignment: Qt.AlignRight

                    Row {
                        spacing: 5
                        SystemTray {}
                        Volume {}
                    }
                }
            }

            Panel {}
        }
    }
}

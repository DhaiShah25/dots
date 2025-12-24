import Quickshell
import QtQuick

import "bar"

Scope {
    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            id: bar
            required property var modelData

            screen: modelData

            color: "#303446"

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

            implicitHeight: 40

            Row {
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }

                Workspaces {}
            }

            Row {
                anchors.centerIn: parent

                ClockWidget {}
            }

            Row {
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }

                SystemTray {}
                Volume {}
            }
        }
    }
}

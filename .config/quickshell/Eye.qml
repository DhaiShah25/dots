pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Scope {
    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            id: eyeTimer
            focusable: false
            color: ThemeConsts.backgroundColor
            visible: false

            required property var modelData
            screen: modelData

            exclusionMode: ExclusionMode.Normal

            anchors {
                top: true
                left: true
                right: true
                bottom: true
            }

            Timer {
                interval: eyeTimer.visible ? 20000 : 1200000
                running: true
                repeat: true
                onTriggered: {
                    eyeTimer.visible = !eyeTimer.visible;
                }
            }

            Text {
                anchors.centerIn: parent
                text: "Eye Break"
                font.family: ThemeConsts.fontFamily
                font.bold: true
                font.pixelSize: 200
                color: ThemeConsts.textColor
            }
        }
    }
}

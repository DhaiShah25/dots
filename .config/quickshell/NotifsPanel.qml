import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            required property var modelData
            screen: modelData

            property var lastNotif: Notifs.trackedNotifications.values[Notifs.trackedNotifications.values.length - 1]

            visible: lastNotif != null

            width: 300
            height: 45

            anchors {
                top: true
                right: true
            }

            exclusionMode: ExclusionMode.Normal

            color: ThemeConsts.backgroundColor

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 10

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 0

                    Text {
                        text: lastNotif != null ? lastNotif.body : ""
                        font.family: ThemeConsts.fontFamily
                        font.pointSize: ThemeConsts.fontSize
                        font.bold: true
                        color: ThemeConsts.textColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }

                    Text {
                        text: lastNotif != null ? lastNotif.body : ""
                        font.family: ThemeConsts.fontFamily
                        font.pointSize: ThemeConsts.fontSize * 0.6
                        color: ThemeConsts.textColor
                        opacity: 0.8
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                }

                Text {
                    text: ""
                    color: ThemeConsts.errorColor
                    font.bold: true

                    MouseArea {
                        anchors.fill: parent
                        onClicked: lastNotif != null && lastNotif.dismiss()
                    }
                }

                Timer {
                    running: true
                    onTriggered: lastNotif != null && lastNotif.dismiss()
                }
            }
        }
    }
}

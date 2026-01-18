import QtQuick
import QtQuick.Layouts
import ".."

ColumnLayout {
    id: notifMenu
    spacing: 8
    width: parent.width

    Text {
        text: "Notifications:"
        font.family: ThemeConsts.fontFamily
        font.bold: true
        font.pointSize: ThemeConsts.fontSize * 1.4
        color: ThemeConsts.textColor
    }

    Repeater {
        model: Notifs.trackedNotifications
        delegate: Rectangle {
            id: delegateRoot
            required property var modelData

            Layout.fillWidth: true
            implicitHeight: 45
            color: ThemeConsts.surfaceColor0
            radius: ThemeConsts.radius

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 10

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 0

                    Text {
                        text: modelData.summary
                        font.family: ThemeConsts.fontFamily
                        font.pointSize: ThemeConsts.fontSize
                        font.bold: true
                        color: ThemeConsts.textColor
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }

                    Text {
                        text: modelData.body
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
                        onClicked: modelData.dismiss()
                    }
                }
            }
        }
    }
}

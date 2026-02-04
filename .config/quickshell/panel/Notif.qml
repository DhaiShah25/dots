import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import ".."

ColumnLayout {
    id: notifMenu
    spacing: 8
    width: parent.width

    Text {
        text: " Notifications:"
        font.family: ThemeConsts.fontFamily
        font.bold: true
        font.pointSize: ThemeConsts.fontSize * 1.4
        color: ThemeConsts.textColor
    }

    Repeater {
        model: Notifs.trackedNotifications.values.slice(-5).reverse()

        delegate: WrapperRectangle {
            color: ThemeConsts.backgroundColor
            radius: 4
            border.color: "#8caaee"
            border.width: 1
            margin: 10

            implicitWidth: parent.width

            ColumnLayout {
                id: contentColumn

                spacing: 12

                RowLayout {
                    spacing: 12

                    Image {
                        visible: !!(modelData.image || modelData.appIcon)
                        source: modelData.image || modelData.appIcon
                        Layout.preferredWidth: 40
                        Layout.preferredHeight: 40
                        Layout.alignment: Qt.AlignTop
                        fillMode: Image.PreserveAspectCrop
                        clip: true
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 4
                        Text {
                            text: modelData.summary
                            font.bold: true
                            color: ThemeConsts.textColor
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }
                        Text {
                            text: modelData.body
                            color: ThemeConsts.textColor
                            opacity: 0.8
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            font.pointSize: 10
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: modelData.dismiss()
                    }
                }
            }
        }
    }
}

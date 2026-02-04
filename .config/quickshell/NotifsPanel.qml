import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Scope {
    Variants {
        model: Quickshell.screens
        delegate: PanelWindow {
            required property var modelData
            screen: modelData
            anchors {
                top: true
                right: true
            }
            margins {
                right: 5
                top: 5
            }

            implicitWidth: 420

            implicitHeight: view.contentHeight
            color: "transparent"
            visible: Notifs.trackedNotifications.values.length > 0

            ListView {
                id: view
                anchors.fill: parent
                spacing: 8
                interactive: false
                model: Notifs.trackedNotifications.values.slice(-3).reverse()

                delegate: WrapperRectangle {
                    width: view.width

                    color: ThemeConsts.backgroundColor
                    radius: 4
                    border.color: "#8caaee"
                    border.width: 1
                    margin: 10

                    ColumnLayout {
                        id: contentColumn

                        spacing: 12

                        RowLayout {
                            spacing: 12

                            Image {
                                visible: modelData.image || modelData.appIcon
                                source: modelData.image || modelData.appIcon
                                Layout.preferredWidth: 40
                                Layout.preferredHeight: 40
                                Layout.alignment: Qt.AlignTop
                                fillMode: Image.PreserveAspectCrop
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

                    Timer {
                        interval: 10000
                        running: true
                        onTriggered: modelData.dismiss()
                    }
                }
            }
        }
    }
}

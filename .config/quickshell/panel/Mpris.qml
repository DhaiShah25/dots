import Quickshell.Widgets
import QtQuick
import Quickshell.Services.Mpris
import QtQuick.Layouts
import ".."

Column {
    spacing: 10
    width: parent.width

    Text {
        text: "Mpris Players:"
        font.family: ThemeConsts.fontFamily
        font.bold: true
        font.pointSize: ThemeConsts.fontSize * 1.4
        color: ThemeConsts.textColor
    }

    ListView {
        model: Mpris.players.values
        width: 450
        height: 400

        delegate: WrapperRectangle {
            required property MprisPlayer modelData
            color: "transparent"
            border.color: ThemeConsts.surfaceColor0
            border.width: 1
            width: 450
            margin: 5
            radius: ThemeConsts.radius
            Row {
                Column {
                    Text {
                        text: modelData.trackTitle
                        font.family: ThemeConsts.fontFamily
                        font.pointSize: ThemeConsts.fontSize * 1.2
                        wrapMode: Text.WordWrap
                        width: 365
                        color: ThemeConsts.textColor
                    }
                    Text {
                        text: modelData.trackArtist
                        font.family: ThemeConsts.fontFamily
                        font.pointSize: ThemeConsts.fontSize
                        wrapMode: Text.WordWrap
                        width: 365
                        color: ThemeConsts.textColor
                    }
                    RowLayout {
                        width: 365
                        spacing: 20
                        Item {
                            Layout.fillWidth: true
                        }
                        Text {
                            text: ""
                            font.family: ThemeConsts.fontFamily
                            font.pixelSize: 16
                            color: ThemeConsts.textColor
                            MouseArea {
                                anchors.fill: parent
                                onClicked: modelData.previous()
                            }
                        }
                        Item {
                            Layout.fillWidth: true
                        }
                        Text {
                            text: modelData.isPlaying ? "" : ""
                            font.family: ThemeConsts.fontFamily
                            font.pixelSize: 16
                            color: ThemeConsts.textColor
                            MouseArea {
                                anchors.fill: parent
                                onClicked: modelData.togglePlaying()
                            }
                        }
                        Item {
                            Layout.fillWidth: true
                        }
                        Text {
                            text: ""
                            font.family: ThemeConsts.fontFamily
                            font.pixelSize: 16
                            color: ThemeConsts.textColor
                            MouseArea {
                                anchors.fill: parent
                                onClicked: modelData.next()
                            }
                        }
                        Item {
                            Layout.fillWidth: true
                        }
                    }
                }
                Image {
                    source: modelData.trackArtUrl
                    fillMode: Image.PreserveAspectCrop
                    height: 75
                    width: 75
                }
            }
        }
    }
}

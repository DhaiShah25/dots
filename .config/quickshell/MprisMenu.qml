import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.Mpris
import ".."

WrapperRectangle {
    readonly property MprisPlayer activePlayer: {
        return Mpris.players.values.find(x => x.isPlaying) || Mpris.players.values[0];
    }
    radius: ThemeConsts.radius
    margin: 10
    color: ThemeConsts.backgroundColor
    Column {
        visible: true
        Text {
            width: 400
            wrapMode: Text.WordWrap
            text: activePlayer.trackTitle
            font.family: ThemeConsts.fontFamily
            font.pixelSize: 18
            color: ThemeConsts.textColor
        }
        Text {
            width: 400
            text: activePlayer.trackArtist
            font.family: ThemeConsts.fontFamily
            font.pixelSize: 14
            color: ThemeConsts.textColor
        }
        RowLayout {
            width: 400
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
                    onClicked: activePlayer.previous()
                }
            }
            Item {
                Layout.fillWidth: true
            }
            Text {
                text: activePlayer.isPlaying ? "" : ""
                font.family: ThemeConsts.fontFamily
                font.pixelSize: 16
                color: ThemeConsts.textColor
                MouseArea {
                    anchors.fill: parent
                    onClicked: activePlayer.togglePlaying()
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
                    onClicked: activePlayer.next()
                }
            }
            Item {
                Layout.fillWidth: true
            }
            Text {
                text: ""
                font.family: ThemeConsts.fontFamily
                font.pixelSize: 16
                color: ThemeConsts.textColor
                MouseArea {
                    anchors.fill: parent
                    onClicked: mprisPanelLoader.source = ""
                }
            }
            Item {
                Layout.fillWidth: true
            }
        }
    }
}

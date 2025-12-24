pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris

Rectangle {
    width: 650
    color: "transparent"

    readonly property MprisPlayer activePlayer: {
        return Mpris.players.values.find(x => x.isPlaying) || Mpris.players.values[0];
    }

    Column {
        Repeater {
            model: Mpris.players.values

            delegate: Text {
                required property MprisPlayer modelData

                text: modelData.trackAlbum + modelData.trackTitle + modelData.trackArtist + modelData.trackAlbumArtist + modelData.trackArtUrl
                font.family: "MonaspiceKr NFP"
                font.pixelSize: 20
                color: "#e0def4"
            }
        }
    }
    PanelWindow {
        anchors {
            bottom: true
            right: true
        }
        exclusionMode: ExclusionMode.Normal
        margins.right: 3

        color: "transparent"
        implicitWidth: 350
        WrapperRectangle {
            radius: 3
            margin: 10
            color: "#303446"
            Column {
                Text {
                    width: 350
                    text: activePlayer.trackTitle
                    font.family: "MonaspiceKr NFP"
                    font.pixelSize: 18
                    color: "#e0def4"
                }
                Text {
                    width: 350
                    text: activePlayer.trackArtist
                    font.family: "MonaspiceKr NFP"
                    font.pixelSize: 14
                    color: "#e0def4"
                }
                RowLayout {
                    width: 350
                    spacing: 20
                    Item {
                        Layout.fillWidth: true
                    }
                    Text {
                        text: "󰙤"
                        font.family: "MonaspiceKr NFP"
                        font.pixelSize: 16
                        color: "#e0def4"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                activePlayer.previous();
                            }
                        }
                    }
                    Item {
                        Layout.fillWidth: true
                    }
                    Text {
                        text: ""
                        font.family: "MonaspiceKr NFP"
                        font.pixelSize: 16
                        color: "#e0def4"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if (activePlayer.playbackState === MprisPlaybackState.Paused) {
                                    activePlayer.playbackState = MprisPlaybackState.Playing;
                                } else {
                                    activePlayer.playbackState = MprisPlaybackState.Paused;
                                }
                            }
                        }
                    }
                    Item {
                        Layout.fillWidth: true
                    }
                    Text {
                        text: "󰙢"
                        font.family: "MonaspiceKr NFP"
                        font.pixelSize: 16
                        color: "#e0def4"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                activePlayer.next();
                            }
                        }
                    }
                    Item {
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }
}

import Quickshell
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            required property var modelData

            screen: modelData
            anchors {
                bottom: true
                right: true
            }
            exclusionMode: ExclusionMode.Normal

            color: ThemeConsts.backgroundColor

            implicitHeight: mprisPanelLoader.status == Loader.Ready ? mprisPanelLoader.height : 30
            implicitWidth: mprisPanelLoader.status == Loader.Ready ? 400 : 30

            Text {
                anchors.centerIn: parent
                text: ""
                font.family: ThemeConsts.fontFamily
                font.pointSize: ThemeConsts.fontSize
                color: ThemeConsts.textColor
                MouseArea {
                    anchors.fill: parent
                    onClicked: mprisPanelLoader.source = "MprisMenu.qml"
                }
            }

            Loader {
                id: mprisPanelLoader
            }
        }
    }
}

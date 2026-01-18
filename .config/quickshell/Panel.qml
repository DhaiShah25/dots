import Quickshell.Hyprland
import Quickshell
import QtQuick
import QtQuick.Layouts
import "panel"

PanelWindow {
    id: hyprPanelLoader

    anchors {
        top: true
        left: true
        bottom: true
    }

    margins {
        top: 3
        bottom: 3
        left: 3
    }

    exclusionMode: ExclusionMode.Normal

    implicitWidth: 450

    color: "#303446"

    visible: false

    GlobalShortcut {
        name: "panelToggle"
        description: "Toggles The Notification Panel"
        onReleased: {
            if (hyprPanelLoader.visible) {
                hyprPanelLoader.visible = false;
            } else {
                hyprPanelLoader.visible = true;
            }
        }
    }

    Column {
        anchors.fill: parent
        spacing: 10

        Notif {}
        Mpris {}
    }
}

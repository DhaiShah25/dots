pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Text {
    id: timeWidget

    text: Qt.formatDateTime(clock.date, "ddd, hh mm A ")
    font.family: "MonaspiceKr NFP"
    font.pixelSize: 20
    color: "#e0def4"

    property bool panelVisible: false

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Timer {
        id: closeTimer
        interval: 300
        repeat: false
        onTriggered: timeWidget.panelVisible = false
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            closeTimer.stop();
            timeWidget.panelVisible = true;
        }
        onExited: closeTimer.start()
    }

    Panel {
        isVisible: timeWidget.panelVisible

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            propagateComposedEvents: true
            onPressed: mouse => mouse.accepted = false

            onEntered: {
                closeTimer.stop();
            }
            onExited: {
                closeTimer.start();
            }
        }
    }
}

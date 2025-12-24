pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Services.Pipewire

Rectangle {
    width: 100
    height: 30
    anchors.verticalCenter: parent.verticalCenter
    color: "transparent"

    Text {
        anchors.verticalCenter: parent.verticalCenter
        text: (Pipewire.defaultAudioSink.audio.volume * 100).toFixed(0) + "% "
        font.family: "MonaspiceKr NFP"
        font.pixelSize: 20
        color: "#e0def4"
    }

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Pipewire.defaultAudioSink.audio.muted = !Pipewire.defaultAudioSink.audio.muted;
        }
        onWheel: wheel => {
            wheel.accepted = true;
            Pipewire.defaultAudioSink.audio.volume += (wheel.angleDelta.y / 12000) ?? (wheel.pixelDelta.y / 3000.0);
            if (Pipewire.defaultAudioSink.audio.volume > 1.00) {
                Pipewire.defaultAudioSink.audio.volume = 1.00;
            } else if (Pipewire.defaultAudioSink.audio.volume < 0) {
                Pipewire.defaultAudioSink.audio.volume = 0;
            }
        }
    }
}

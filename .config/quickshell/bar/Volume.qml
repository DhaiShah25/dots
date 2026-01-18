pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Services.Pipewire
import ".."

Text {
    anchors.verticalCenter: parent.verticalCenter
    text: (Pipewire.defaultAudioSink.audio.volume * 100).toFixed(0) + "% "
    font.family: ThemeConsts.fontFamily
    font.pixelSize: 16
    color: "#e0def4"

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
            Pipewire.defaultAudioSink.audio.volume = Math.max(0, Math.min(1, Pipewire.defaultAudioSink.audio.volume));
        }
    }
}

pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import ".."

Text {
    id: timeWidget

    text: Qt.formatDateTime(clock.date, "ddd - hh:mm A")
    font.family: ThemeConsts.fontFamily
    font.pointSize: ThemeConsts.fontSize
    color: ThemeConsts.textColor

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}

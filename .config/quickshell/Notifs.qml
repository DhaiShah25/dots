pragma Singleton
import QtQuick
import Quickshell.Services.Notifications

NotificationServer {
    onNotification: n => n.tracked = true
}

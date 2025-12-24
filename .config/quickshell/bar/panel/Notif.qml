pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications

Rectangle {
    id: notifIcon
    height: 425
    color: "#0affffff"

    property bool panelVisible: false
    ListModel {
        id: notificationsList
    }

    NotificationServer {
        onNotification: notif => {
            notif.tracked = true;

            console.log("Received notification from: " + notif.appName);
            console.log("Summary: " + notif.summary);
            notificationsList.append({
                "notifObject": notif
            });
            console.log(notificationsList);
        }
    }

    ColumnLayout {
        implicitHeight: 425
        width: 600
        Repeater {
            model: notificationsList
            delegate: WrapperRectangle {
                required property var index
                required property Notification modelData
                height: 40
                width: 600
                radius: 3
                color: "#0fffffff"

                Component.onCompleted: {
                    console.log(modelData);
                }

                Column {
                    Text {
                        text: modelData.appName
                        font.bold: true
                        font.pixelSize: 16
                    }
                    Text {
                        text: modelData.summary
                        font.pixelSize: 12
                    }
                    Rectangle {
                        width: 30
                        height: 30
                        color: "red"
                        radius: 15

                        Text {
                            text: "X"
                            anchors.centerIn: parent
                            color: "white"
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                modelData.tracked = false;
                                notificationsList.remove(index);
                            }
                        }
                    }
                }
            }
        }
    }
}

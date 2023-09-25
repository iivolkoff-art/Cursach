import QtQuick 2.12
import QtQuick.Window 2.12

Item{
    id:testsWindows
    Rectangle{
        anchors.fill: parent
        color: backgroundColor
        TopPanel {
            id: topPanel
            anchors.top: parent.top
            width: parent.width
            height: parent.height * 0.08
        }
        Item{
            id: middlePanel
            width: parent.width
            anchors.top: topPanel.bottom
            anchors.bottom: bottomPanel.top
            Rectangle{
                anchors.fill: parent
                color: "red"
            }
        }
        MyBottomPanel {
            id: bottomPanel
            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height * 0.12

        }
    }
}

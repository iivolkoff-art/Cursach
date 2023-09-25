 import QtQuick 2.12
import QtQuick.Window 2.12


Item{
    id: mainWindow
    Rectangle{
        anchors.fill: parent
        color: backgroundColor

        MyMainTopPanel {
            id: mainTopPanel
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: parent.height * 0.08
        }
        MyMainCenterPanel {
            id: mainCenterPanel
            anchors.bottom: mainBottomPanel.top
            anchors.top: mainTopPanel.bottom
            width: parent.width
        }
        MyMainBottomPanel {
            id: mainBottomPanel
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 0.12
        }

    }
}

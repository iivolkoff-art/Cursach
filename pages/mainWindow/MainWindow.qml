import QtQuick 2.12
import QtQuick.Window 2.12
import 'qrc:/components/mainWindow'
import testsCreater


Item{
    id: mainWindow
    TestsCreater{
        id: testsCreater
    }
    property int testsCircleCount: testsCreater.getTestsCount()
    Rectangle{
        anchors.fill: parent
        color: isDark ? backgroundColor : whiteBackgroundColor

        MainTopPanel {
            id: mainTopPanel
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: parent.height * 0.08
        }
        MainCenterPanel {
            id: mainCenterPanel
            anchors.bottom: mainBottomPanel.top
            anchors.top: mainTopPanel.bottom
            width: parent.width
        }
        MainBottomPanel {
            id: mainBottomPanel
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 0.12
        }
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12
import 'qrc:/components/testWindow'
import './resultPage'


Item{
    id:testsWindows
    property int questionNumber: 1
    property int testNumber: -1
    property string possibleAnswer: ""
    property int rightAnswer: 0
    property int points: 0
    property string mainTestNumber: "0"
    Rectangle{
        anchors.fill: parent
        color: isDark ? backgroundColor : whiteBackgroundColor
        TopPanel {
            id: topPanel
            anchors.top: parent.top
            width: parent.width
            height: parent.height * 0.08
        }
        MiddlePanel {
            id: middlePanel
            anchors.bottom: bottomPanel.top
            anchors.top: topPanel.bottom
            width: parent.width
            anchors.bottomMargin: parent.height * 0.05
        }
        BottomPanel {
            id: bottomPanel
            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height * 0.1
        }
        ResultPage {
            id: resultPage
            anchors.fill: parent
            visible: false
        }
    }
}

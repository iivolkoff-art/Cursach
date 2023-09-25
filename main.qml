import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.2
import Qt.labs.platform 1.1
import './mainWindow'
import './testsWindows'


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Cursach")


    property string windowsVisibleNumber: "1" // mainWindow
    property string mainVisibleWindows: "3" // centerPages

    property color backgroundColor: "#343838"

    Rectangle{
        anchors.fill: parent
        MainWindow {
            id: mainWindow
            anchors.fill: parent
            visible: windowsVisibleNumber == "0" ? true : false
        }
        TestsWindows {
            id: testsWindows
            anchors.fill: parent
            visible: windowsVisibleNumber == "1" ? true : false
        }

    }
}

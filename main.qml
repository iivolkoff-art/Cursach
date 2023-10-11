import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.2
import Qt.labs.platform 1.1
import './mainWindow'
import './testsWindows'
import './helloWindow'

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("GenDev")

    property string windowsVisibleNumber: "0" // mainWindow
    property string mainVisibleWindows: "3" // centerPage9

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
        HelloWindow {
            id: helloWindow
            anchors.fill: parent
            visible: windowsVisibleNumber == "2" ? true : false
        }
    }
}

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.2
import Qt.labs.platform 1.1
import 'pages/mainWindow'
import 'pages/testWindow'
import 'pages/authWindow'

import settingPage

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("GenDev")


    SettingPage{
        id: settingPage
    }

    property string windowsVisibleNumber: "2" // mainWindow
    property string mainVisibleWindows: "3" // centerPage
    property bool isDark: settingPage.getIsDarkTheme()
    //visibility: Window.FullScreen

    property color backgroundColor: "#313131"
    property color whitePanelColor: "#4E7CE2"
    property color whiteBackgroundColor: "#FFFFFF"


    Rectangle {
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
        AuthorizationPage {
            id: authWindow
            anchors.fill: parent
            visible: windowsVisibleNumber == "2" ? true : false
        }
    }
}

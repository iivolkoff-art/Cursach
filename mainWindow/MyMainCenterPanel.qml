import QtQuick 2.12
import QtQuick.Window 2.12
import './profilePage'
import './settingsPage'
import './testsPage'


Item{
    id: mainCenterPanel
    Rectangle{
        anchors.fill: parent
        SettingsPage {
            id: settingsPage
            anchors.fill: parent
            visible: mainVisibleWindows === "2" ? true : false
        }
        ProfilePage {
            id: profilePage
            anchors.fill: parent
            visible: mainVisibleWindows === "4" ? true : false
        }
        TestsPage {
            id: testsPage
            anchors.fill: parent
            visible: mainVisibleWindows === "3" ? true : false
        }
    }
}

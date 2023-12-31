import QtQuick 2.12
import QtQuick.Window 2.12
import 'qrc:/pages/mainWindow/profilePage'
import 'qrc:/pages/mainWindow/settingsPage'
import 'qrc:/pages/mainWindow/testsWayPage'
import 'qrc:/pages/mainWindow/textHelperPage'


Item{
    id: mainCenterPanel

    Rectangle{
        id: test
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
        TextHelperPage {
            id: textHelperPage
            anchors.fill: parent
            visible: mainVisibleWindows === "5" ? true : false
        }
    }
}

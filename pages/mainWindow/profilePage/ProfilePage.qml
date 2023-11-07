import QtQuick 2.12
import QtQuick.Window 2.12
import 'qrc:/components/mainWindow/profilePanels/authorizationPanels'
import 'qrc:/components/mainWindow/profilePanels/showcasePanels'

Item{
    id: profilePage

    Rectangle {
        anchors.fill: parent
        color: isDark ? backgroundColor : whiteBackgroundColor

        ShowcasePanelMiddle {
             id: showcasePanel
             anchors.fill: parent
        }
    }
}

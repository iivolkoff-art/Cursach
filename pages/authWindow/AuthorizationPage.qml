import QtQuick 2.12
import QtQuick.Window 2.12
import 'qrc:/components/authorizationWindow'
import authorizationWindow


Item{
    id: authWindow
    property bool isRegistering: false
    AuthorizationWindow{
        id: authorizationWindow
    }

    Rectangle {
        anchors.fill: parent
        color: isDark ? backgroundColor : whiteBackgroundColor


        AuthorizationPanelMiddle {
            id: authPanel
            anchors.fill: parent
            visible: authWindow.isRegistering ? false : true
        }
        RegistrationPanel {
            id: regPanel
            anchors.fill: parent
            visible: authWindow.isRegistering ? true : false
        }
    }
}

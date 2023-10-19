import QtQuick 2.12
import QtQuick.Window 2.12
import textHelper

import 'qrc:/components/mainWindow/textHelperPanels'




Item{
    id: textHelperPage
    property color buttonColor: "#008C9E"
    anchors.fill: parent

    TextHelper{
        id: textHelper
    }

    Rectangle{
        anchors.fill: parent
        color: backgroundColor
        ChatPanel {
            id: chatField
            anchors.top: parent.top
            width: parent.width
            height: parent.height * 0.9
        }
        InputPanel {
            id: inputField
            width: parent.width
            anchors.top: chatField.bottom
            anchors.bottom: parent.bottom
        }
    }
}

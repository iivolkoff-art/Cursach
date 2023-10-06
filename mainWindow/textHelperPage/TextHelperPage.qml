import QtQuick 2.12
import QtQuick.Window 2.12


Item{
    id: textHelperPage
    property color buttonColor: "#008C9E"
    anchors.fill: parent
    Rectangle{
        anchors.fill: parent
        color: backgroundColor
        ChatField {
            id: chatField
            anchors.top: parent.top
            width: parent.width
            height: parent.height * 0.9
        }
        InputField {
            id: inputField
            width: parent.width
            anchors.top: chatField.bottom
            anchors.bottom: parent.bottom

        }
    }
}

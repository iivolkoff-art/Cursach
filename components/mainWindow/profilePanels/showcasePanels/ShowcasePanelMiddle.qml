import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: showcasePanel
    property color baseColor: isDark ? whiteBackgroundColor : backgroundColor
    property color backColor: isDark ? backgroundColor : whiteBackgroundColor

    Rectangle {
        anchors.fill: parent
        color: parent.backColor

        Button {
            id: changeProfile
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width / 2.5

            text: "СМЕНИТЬ ПРОФИЛЬ"
            onClicked: {
                profileMode = 1;
            }
        }

        Text {
            id: testText
            anchors.top: changeProfile.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            text: "ПРОСМОТР ПРОФИЛЯ"
            color: showcasePanel.baseColor
            font.pixelSize: parent.height * 0.04
            font.bold: true
            font.letterSpacing: -1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBaseline
         }
    }
}

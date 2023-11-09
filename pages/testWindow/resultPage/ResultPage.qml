import QtQuick 2.12
import QtQuick.Window 2.12
import 'qrc:/components/testWindow'


Item {
    id: resultPage
    Rectangle{
        anchors.fill: parent
        color: isDark ? backgroundColor : whiteBackgroundColor
        Rectangle{
            id: close
            anchors.right: parent.right
            anchors.margins: (parent.height + parent.width) * 0.005
            anchors.top: parent.top
            height: parent.height * 0.1
            width: height
            color: "transparent"
            Text{
                anchors.centerIn: parent
                text: "X"
                color: "#878787"
                font.pixelSize: (parent.width * 2) * 0.3
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    windowsVisibleNumber = 0
                    questionNumber = 1
                    middlePanel.choiseIndex = -1
                    resultPage.visible = false
                }
            }
        }
        Text{
            anchors.centerIn: parent
            text: "А ты крутой..."
            font.pixelSize: (parent.height + parent.width) * 0.02
            color: isDark ? "white" : "black"
        }
    }
}

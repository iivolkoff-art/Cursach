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
                    rightAnswer = 0
                    points = 0
                }
            }
        }
        Text{
            id: pointsText
            anchors.centerIn: parent
            text: "Очки: " + points
            font.pixelSize: (parent.height + parent.width) * 0.04
            color: isDark ? "white" : "black"
        }
        Text{
            id: rightAnswerText
            anchors.bottom: pointsText.top
            anchors.horizontalCenter: pointsText.horizontalCenter
            text: "А ты крутой...\n" + rightAnswer + "/10"
            font.pixelSize: (parent.height + parent.width) * 0.02
            color: isDark ? "white" : "black"
        }
    }
}

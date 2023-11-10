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
            anchors.margins: (parent.height + parent.width) * 0.01
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
            id: rightAnswerText
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            text: "А ты крутой... " + rightAnswer + "/10"
            font.pixelSize: (parent.height + parent.width) * 0.02
            color: isDark ? "white" : "black"
        }
        Text{
            id: pointsText
            anchors.top: rightAnswerText.bottom
            anchors.horizontalCenter: rightAnswerText.horizontalCenter
            text: "Очки: " + points
            font.pixelSize: (parent.height + parent.width) * 0.03
            color: isDark ? "white" : "black"
        }
        Rectangle{
            id: stat
            anchors.top:  pointsText.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.03
            width: parent.width
            anchors.horizontalCenter: pointsText.horizontalCenter
            color: "transparent"

            Repeater{
                model: 10

                Rectangle{
                    color: "transparent"
                    width: stat.width / 2
                    height: stat.height / 10
                    anchors.horizontalCenter: stat.horizontalCenter
                    y: index * (stat.height / 10)

                    Text{
                        anchors.left: parent.left
                        text: "Вопрос " + (index + 1)
                        color: "grey"
                        font.pixelSize: (parent.height + parent.width) * 0.07
                    }

                    Text{
                        anchors.right: parent.right
                        text: index % 2 == 0 ? "X" : "*"
                        color: index % 2 == 0 ? "red" : "green"
                        font.pixelSize: (parent.height + parent.width) * 0.07
                    }
                }
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12
import testsCreater


Item{
    id:bottomPanel
    TestsCreater{
        id: testsCreater
    }

    Rectangle{
        anchors.fill: parent
        color: isDark ? backgroundColor : whiteBackgroundColor
        Rectangle{
            id: button
            anchors.centerIn: parent
            height: parent.height
            width: parent.width * 0.9
            //anchors.margins: (parent.width + parent.height) * 0.015
            color: "#103B99"
            radius: parent.height * 0.3
            Text{
                anchors.centerIn: parent
                text: "Продолжить"
                color: "white"
                font.pixelSize: parent.height * 0.4
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(possibleAnswer !== ""){
                        questionNumber += 1
                        middlePanel.choiseIndex = -1
                        answersArray.push("X")
                        if(possibleAnswer === testsCreater.getObjectFromJson(questionNumber - 1, "answer")){
                            rightAnswer += 1
                            points += parseInt(testsCreater.getObjectFromJson(questionNumber - 1, "points"))
                            answersArray[(questionNumber - 2)] = "*"
                        }
                        possibleAnswer = ""
                        if(questionNumber > 10){
                            resultPage.visible = true
                            questionNumber = 1
                        }
                    }
                }
            }
        }
    }
}

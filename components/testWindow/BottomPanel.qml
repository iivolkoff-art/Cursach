import QtQuick 2.12
import QtQuick.Window 2.12
import 'qrc:/pages/testWindow'

Item{
    id:bottomPanel

    function popUpOpen(color, text){
        popUp.popUpColor = color
        popUp.popUpText = text
        popUp.visible = true
    }

    Rectangle{
        anchors.fill: parent
        color: isDark ? backgroundColor : whiteBackgroundColor
        Rectangle{
            id: button
            anchors.centerIn: parent
            height: parent.height
            width: parent.width * 0.6
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
                        answersArray.push("X")
                        if(possibleAnswer === testsWindow.getObjectFromJson(mainTestNumber, questionNumber, "answer")){
                            rightAnswer += 1
                            points += parseInt(testsWindow.getObjectFromJson(mainTestNumber, questionNumber, "points"))
                            answersArray[(questionNumber - 1)] = "*"
                            popUpOpen("green", "Good")
                        }
                        else{
                            popUpOpen("red", testsWindow.getObjectFromJson(mainTestNumber, questionNumber, "explanation"))
                        }
                        console.log(answersArray[(questionNumber - 1)])
                        possibleAnswer = ""
                    }
                }
            }
        }
    }
}

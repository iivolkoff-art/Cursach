import QtQuick 2.12
import QtQuick.Window 2.12


Item{
    id:bottomPanel
    Rectangle{
        anchors.fill: parent
        color: backgroundColor
        Rectangle{
            id: button
            anchors.fill: parent
            //anchors.margins: (parent.width + parent.height) * 0.015
            color: "#00B4CC"
            radius: (parent.width + parent.height) * 0.01
            Text{
                anchors.centerIn: parent
                text: "Продолжить"
                color: backgroundColor
                font.pixelSize: parent.height * 0.4
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    questionNumber += 1
                    middlePanel.choiseIndex = -1
                    if(questionNumber > 10){
                        windowsVisibleNumber = 0
                        questionNumber = 1
                    }
                }
            }
        }
    }
}

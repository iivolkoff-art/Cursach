import QtQuick 2.12
import QtQuick.Window 2.12
import 'qrc:/components/testWindow'
import './resultPage'


Item{
    id: popUp
    property color infColor: Qt.rgba(0, 0, 0, 0.3)
    property string popUpText: "test"
    property color popUpColor: "red"
    Rectangle{
        anchors.fill: parent
        color: infColor
        Rectangle{
            anchors.centerIn: parent
            width: parent.width * 0.4
            height: parent.height * 0.2
            color: popUpColor
            radius: (parent.width + parent.height) * 0.01
            border.color: "black"
            Text{
                anchors.centerIn: parent
                text: popUpText
                color: "black"
                font.pixelSize: (parent.width + parent.height) * 0.05
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                popUp.visible = false
                questionNumber += 1
                middlePanel.choiseIndex = -1

                if(questionNumber > 10){
                    resultPage.visible = true
                    questionNumber = 1
                }
            }
        }
    }
}

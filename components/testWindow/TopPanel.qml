import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Item{
    id:topPanel
    Rectangle{
        anchors.fill: parent
        color: isDark ? backgroundColor : whiteBackgroundColor
        id: learnStatusBig
        Rectangle{
            id: close
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height * 0.9
            width: height
            color: "transparent"
            Text{
                anchors.centerIn: parent
                text: "X"
                color: "#878787"
                font.pixelSize: (parent.width * 2) * 0.35
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    windowsVisibleNumber = 0
                    questionNumber = 1
                    middlePanel.choiseIndex = -1
                    possibleAnswer = ""
                    rightAnswer = 0
                    points = 0
                }
            }
        }

        Rectangle{
            id: learnStatus
            anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width * 0.5
            height: parent.height * 0.2
            color: "transparent"
            ListView {
                anchors.fill: learnStatus
                model: 10 // count of mini-rectangle
                spacing: learnStatus.width * 0.03

                delegate: Rectangle {
                    width: learnStatus.width / 13.7
                    height: learnStatus.height
                    radius: (parent.width + parent.height) * 0.006
                    color: model.index < questionNumber ? "#4E7CE2" : "#CFCFCF"
                }

                orientation: ListView.Horizontal
            }
        }
//        Rectangle{
//            id: line
//            anchors.bottom: learnStatusBig.bottom
//            width: learnStatusBig.width
//            height: 1
//            color: "#686F6F"
//        }
    }
}

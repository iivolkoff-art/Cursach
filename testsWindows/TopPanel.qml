import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Item{
    id:topPanel
    property int questionNumber: 8
    Rectangle{
        anchors.fill: parent
        color: backgroundColor
        id: learnStatusBig
        Rectangle{
            id: close
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height * 0.9
            width: height
            color: backgroundColor
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
                }
            }

        }

        Rectangle{
            id: learnStatus
            anchors.centerIn: parent
            width: parent.width * 0.7
            height: parent.height * 0.2
            color: backgroundColor
            ListView {
                anchors.fill: learnStatus
                model: 10 // count of mini-rectangle
                spacing: learnStatus.width * 0.03

                delegate: Rectangle {
                    width: learnStatus.width / 13.7
                    height: learnStatus.height
                    color: model.index < questionNumber ? "#00B4CC" : "#878787"
                }

                orientation: ListView.Horizontal
            }
        }
        Rectangle{
            id: line
            anchors.bottom: learnStatusBig.bottom
            width: learnStatusBig.width
            height: 1
            color: "#686F6F"
        }
    }
}

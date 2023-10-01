import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3



Item{
    id: middlePanel
    Rectangle{
        anchors.fill: parent
        color: backgroundColor
        Rectangle{
            id: question
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.9
            height: parent.height * 0.4
            color: backgroundColor
            Image {
                id: name
                width: parent.width * 0.6
                height: parent.height * 0.9
                source: "qrc:/images/test.PNG"
                anchors.centerIn: parent
            }
        }
        Rectangle{
            id: answer
            anchors.top: question.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.01
            anchors.horizontalCenter: question.horizontalCenter
            width: question.width
            color: backgroundColor
            ListView {
                anchors.fill: answer
                model: 4
                spacing: answer.height * 0.02
                delegate: Rectangle {
                    width: answer.width
                    height: answer.height / 4 - answer.height * 0.02
                    color: "#878787"
                    radius: (parent.height + parent.width) * 0.01
                    Text{
                        id: answerText
                        anchors.centerIn: parent
                        text: "test"
                        font.pixelSize: (parent.height + parent.width) * 0.07
                        color: backgroundColor
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log(index)
                        }
                    }
                }

                orientation: ListView.Vertical
            }
        }
    }
}

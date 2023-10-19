import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import testsCreater



Item{
    id: middlePanel
    property int choiseIndex: -1
    property int testNumber: testsWindows.testNumber


    TestsCreater{
        id: testsCreater
    }

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
                source: "qrc:/assets/images/test.PNG"
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
                interactive: false
                delegate: Rectangle {
                    width: answer.width
                    height: answer.height / 4 - answer.height * 0.02
                    color: choiseIndex === index ? "#00B4CC" : "#878787"
                    radius: (parent.height + parent.width) * 0.01
                    Text{
                        id: answerText
                        anchors.centerIn: parent
                        text: testsCreater.getInf()
                        font.pixelSize: (parent.height + parent.width) * 0.07
                        color: backgroundColor
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            choiseIndex = index
                            console.log(index)
                        }
                    }
                }

                orientation: ListView.Vertical
            }
        }
    }
    onTestNumberChanged: {
        answerText.text = testsCreater.getInf()
    }
}

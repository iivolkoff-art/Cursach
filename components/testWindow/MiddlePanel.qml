import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
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
        color: isDark ? backgroundColor : whiteBackgroundColor
        Rectangle{
            id: testsBorder
            anchors.centerIn: parent
            width: parent.width * 0.9
            height: parent.height * 0.9
            color: "transparent"
            border.color: "#4166B7"
            radius: parent.height * 0.08
            Rectangle{
                id: question
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.9
                height: parent.height * 0.35
                color: "transparent"
                Text{
                    anchors.top: parent.top
                    font.pixelSize:parent.height  * 0.2
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: isDark ? "#CFCFCF" : "#878787"
                    text: "Вопрос " + questionNumber
                }

                Image {
                    id: name
                    width: parent.width * 0.6
                    height: parent.height * 0.9
                    source: "qrc:/assets/images/test.PNG"
                    anchors.centerIn: parent
                    visible: false
                }
                Text{
                    anchors.centerIn: parent
                    font.pixelSize:text.length < 15 ? ((parent.height + parent.width) * 0.07)
                                                    : ((parent.height + parent.width) * 0.07) / (text.length * 0.045)
                    color: isDark ? "white" : "black"
                    text: windowsVisibleNumber == 1 ? testsCreater.getObjectFromJson(questionNumber.toString(), "question") : ""
                }
            }
            Rectangle{
                id: answer
                anchors.top: question.bottom
                anchors.bottom: testsBorder.bottom
                //anchors.bottomMargin: parent.height * 0.01
                anchors.horizontalCenter: question.horizontalCenter
                width: testsBorder.width
                color: "transparent"
                ListView {
                    anchors.fill: answer
                    model: 4
                    spacing: answer.height * 0.05
                    interactive: false
                    delegate: Rectangle {
                        width: parent.width
                        height: answer.height / 4 * 0.9
                        color: choiseIndex === index ? "#103B99" : "#4166B7"
                        radius: parent.height * 0.07
                        Text{
                            id: answerText
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            text: windowsVisibleNumber == 1 ? testsCreater.getParametersOfId(questionNumber.toString())[index]
                                                            : ""
                            font.pixelSize: parent.height * 0.4
                            anchors.leftMargin: parent.width * 0.01
                            color: "#FFFFFF"
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                choiseIndex = index
                                possibleAnswer = testsCreater.getParametersOfId(questionNumber.toString())[index]
                            }
                        }
                    }

                    orientation: ListView.Vertical
                }
            }
        }
    }
//    onTestNumberChanged: {
//        answerText.text = testsCreater.getInf()
//    }
}

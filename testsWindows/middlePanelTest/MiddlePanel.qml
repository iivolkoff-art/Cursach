import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15


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
            color: "blue"
        }
    }
}

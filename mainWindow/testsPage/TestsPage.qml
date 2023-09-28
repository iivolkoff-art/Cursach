import QtQuick 2.12
import QtQuick.Window 2.12

Item{
    id: testsPage
    property int constHeight: 640
    property int constWidth: 480
    property int heightCircle: (height / constHeight) * constHeight * 0.1
    property int widthCircle: (height / constHeight) * constHeight * 0.1
    Rectangle{
        anchors.fill: parent
        color: backgroundColor
        Rectangle{
            id: firstTestCircle
            x: Math.random() * (parent.width * 0.8)
            y: parent.height * 0.1
            width: widthCircle
            height: heightCircle
            color: "#008C9E"
            radius: width / 2
            Text{
                anchors.centerIn: parent
                font.pixelSize: parent.height * 0.4
                text: "1"
                color: "white"
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    windowsVisibleNumber = 1
                }
            }
        }

    }
}

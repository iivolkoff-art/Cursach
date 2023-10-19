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
            z: 1
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
        Rectangle{
            id: secondTestCircle
            z: 1
            x: Math.random() * (parent.width * 0.8)
            y: parent.height * 0.3
            width: widthCircle
            height: heightCircle
            color: "#008C9E"
            radius: width / 2
            Text{
                anchors.centerIn: parent
                font.pixelSize: parent.height * 0.4
                text: "2"
                color: "white"
                font.bold: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    windowsVisibleNumber = 1
                    testsWindows.testNumber = 1
                }
            }
        }
        Canvas {
            anchors.fill: parent
            z: 0
            onPaint: {
                var ctx = getContext("2d");
                ctx.strokeStyle = "#D9D9D9";
                ctx.lineWidth = 2;
                ctx.beginPath();
                ctx.moveTo(firstTestCircle.x + firstTestCircle.width / 2, firstTestCircle.y + firstTestCircle.height / 2);
                ctx.lineTo(secondTestCircle.x+ secondTestCircle.width / 2, secondTestCircle.y + secondTestCircle.height / 2);
                ctx.stroke();
            }
        }
    }
}

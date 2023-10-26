import QtQuick 2.12
import QtQuick.Window 2.12


//Item{
//    id: testsPage
//    property int constHeight: 640
//    property int constWidth: 480
//    property int heightCircle: (height / constHeight) * constHeight * 0.1
//    property int widthCircle: (height / constHeight) * constHeight * 0.1
//    Rectangle{
//        anchors.fill: parent
//        color: isDark ? backgroundColor : whiteBackgroundColor
//        Rectangle{
//            id: firstTestCircle
//            z: 1
//            x: (parent.width * 0.3) + Math.random() * (parent.width * 0.5)
//            y: parent.height * 0.1
//            width: widthCircle
//            height: heightCircle
//            color: "#4E7CE2"
//            radius: width / 2
//            Text{
//                anchors.centerIn: parent
//                font.pixelSize: parent.height * 0.4
//                text: "1"
//                color: "white"
//                font.bold: true
//            }
//            MouseArea{
//                anchors.fill: parent
//                onClicked: {
//                    windowsVisibleNumber = 1
//                }
//            }
//        }
//        Rectangle{
//            id: secondTestCircle
//            z: 1
//            x: firstTestCircle.x + Math.random() * (parent.width * 0.3) - (parent.width * 0.3 / 2)
//            y: parent.height * 0.2
//            width: widthCircle
//            height: heightCircle
//            color: "#4E7CE2"
//            radius: width / 2
//            Text{
//                anchors.centerIn: parent
//                font.pixelSize: parent.height * 0.4
//                text: "2"
//                color: "white"
//                font.bold: true
//            }
//            MouseArea{
//                anchors.fill: parent
//                onClicked: {
//                    windowsVisibleNumber = 1
//                    testsWindows.testNumber = 1
//                }
//            }
//        }
////        Canvas {
////            anchors.fill: parent
////            z: 0
////            onPaint: {
////                var ctx = getContext("2d");
////                ctx.strokeStyle = "#4E7CE2";
////                ctx.lineWidth = 2;
////                ctx.beginPath();
////                ctx.moveTo(firstTestCircle.x + firstTestCircle.width / 2, firstTestCircle.y + firstTestCircle.height / 2);
////                ctx.lineTo(secondTestCircle.x+ secondTestCircle.width / 2, secondTestCircle.y + secondTestCircle.height / 2);
////                ctx.stroke();
////            }
////        }
//    }
//}


Item {
    id: testsPage

    property int constHeight: 640
    property int constWidth: 480
    property int heightCircle: (height / constHeight) * constHeight * 0.1
    property int widthCircle: (height / constHeight) * constHeight * 0.1

    Rectangle{
        anchors.fill: parent
        color: isDark ? backgroundColor : whiteBackgroundColor

        Repeater {
            model: 7
            Rectangle {
                width: widthCircle
                height: heightCircle
                color: "#4E7CE2"
                radius: width / 2


                //x: index === 0 ? (testsPage.width / 2) - (widthCircle / 2) : (testsPage.width * 0.1) + Math.random() * (testsPage.width * 0.8)
                y: index === 0 ? parent.height * 0.02 : index * parent.height * 0.13 + parent.height * 0.02

                x: index === 0 ? (testsPage.width / 2) - (widthCircle / 2) : previousCircle.x + (Math.random() - 0.5) * 2 * testsPage.width * 0.15
                property var previousCircle: index === 0 ? this : parent.children[index - 1]

                Text {
                    anchors.centerIn: parent
                    font.pixelSize: parent.height * 0.4
                    text: index + 1
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
        }
    }
}

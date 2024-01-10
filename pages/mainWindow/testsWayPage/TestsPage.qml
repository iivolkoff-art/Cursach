import QtQuick 2.12
import QtQuick.Window 2.12
import 'qrc:/pages/testWindow/resultPage'
import 'qrc:/pages/testWindow'

import testsWayPage


Item {
    id: testsPage

    TestsWayPage{
        id: testsWayPage
    }

    property int constHeight: 640
    property int constWidth: 480
    property int heightCircle: (height / constHeight) * constHeight * 0.1
    property int widthCircle: (height / constHeight) * constHeight * 0.1
    property int testsCircleCount: testsWayPage.getTestsCount()

    Rectangle{
        anchors.fill: parent
        color: isDark ? backgroundColor : whiteBackgroundColor
        Timer{
            id: timer
            interval: 2000
            running: true
            repeat: true
            onTriggered: {
                testsCircleCount = testsWayPage.getTestsCount()
            }
        }

        Repeater {
            model: testsCircleCount
            Rectangle {
                width: widthCircle
                height: heightCircle
                color: "#4E7CE2"
                radius: width / 2

                y: index === 0 ? parent.height * 0.02 : index * parent.height * 0.13 + parent.height * 0.02

                x: index === 0 ? (testsPage.width / 2) - (widthCircle / 2) : previousCircle.x + (Math.random() - 0.5) * 2 * testsPage.width * 0.04
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
                        //testsCreater.setTestNumber((index + 1).toString())
                        windowsVisibleNumber = 1
                        testsWindows.testNumber = 1
                        testsWindows.mainTestNumber = (index + 1).toString()
                    }
                }
            }
        }
    }
}

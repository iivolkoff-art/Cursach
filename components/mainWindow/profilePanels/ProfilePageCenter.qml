import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 2.12

Rectangle{
    id: profilePageCenter
    anchors.fill: parent
    color: isDark ? backgroundColor : whiteBackgroundColor
    property int rowWidth: width / 1.125

    property string userName: "Ваше имя"
    property string userNumber: "+375 (33) 635-22-45"

    property int userScore: 0
    property double partOfLearned: 0.30
    property int percentageOfLearned: partOfLearned * 100

    property int countOfLanguages: 2

    property string userId: "2549265659"

    ColumnLayout  {
        id: layout
        width: rowWidth
        height: parent.height
        property int radius: 20
        spacing: 3
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: image
            width: 50
            height: 50
            source: "qrc:/assets/images/profileImages/EmptyIcon.png"
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }
        Item{
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            width: name.width
            height: name.paintedHeight
            Text {
                id: name
                font.pixelSize: 25
                font.underline: true
                color: isDark ? "white" : "black"
                font.family: "Jost"
                text: qsTr(userName)
            }
        }
        Item{
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            width: number.width
            height: number.paintedHeight
            Text {
                id: number
                font.pixelSize: 15
                color: isDark ? "white" : "black"
                font.family: "Jost"
                text: qsTr(userNumber)
            }
        }
        Item{
            height: 50
            width: profilePage.rowWidth
            Rectangle{
                id: startField
                height: parent.height
                width: profilePage.rowWidth / 2
                radius: layout.radius
                color: "#4E7CE2"
                ColumnLayout  {
                    spacing: 0
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Text {
                            anchors.bottom: parent.bottom
                            color: "white"
                            font.pixelSize: 15
                            font.family: "Jost"
                            text: qsTr("Start")
                        }
                    }
                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Text {
                            Layout.alignment: Qt.Top
                            font.pixelSize: 15
                            font.family: "Jost"
                            text: qsTr(countOfLanguages + " язык")
                        }
                    }
                }
                CircleWithText{
                    text: percentageOfLearned + "%"
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 4
                    anchors.rightMargin: 7
                }
            }
            Rectangle{
                id: points
                anchors.left: startField.right
                height: parent.height
                width: profilePage.rowWidth / 2
                radius: layout.radius
                color: "#4E7CE2"
                ColumnLayout  {
                    spacing: 0
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Text {
                            anchors.bottom: parent.bottom
                            font.pixelSize: 15
                            color: "white"
                            font.family: "Jost"
                            text: qsTr("Баллы")
                        }
                    }

                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Text {
                            Layout.alignment: Qt.Top
                            font.pixelSize: 15
                            font.family: "Jost"
                            text: qsTr(userScore + " баллов")
                        }
                    }
                }

            }
        }
        Item{
            height: 80
            Rectangle{
                height: parent.height
                width: profilePage.rowWidth
                radius: layout.radius
                color: "#4E7CE2"
                Text {
                    anchors.left: status.left
                    anchors.bottom: status.top
                    anchors.bottomMargin: 10
                    font.pixelSize: 15
                    font.family: "Jost"
                    color: "#FFFFFF"
                    text: qsTr("Ваш уровень изучения ЯП")
                }
                Rectangle{
                    id: status
                    height: 5
                    width: parent.width * 0.95
                    radius: 90
                    anchors.centerIn: parent
                    color: !isDark ? whiteBackgroundColor : backgroundColor
                    Rectangle{
                        height: parent.height
                        width: parent.width * partOfLearned
                        radius: parent.radius
                        color: !isDark ? "#BACFFF" : "#92A8D9"
                    }
                }
                Text {
                    anchors.left: status.left
                    anchors.top: status.bottom
                    anchors.topMargin: 10
                    font.pixelSize: 15
                    font.family: "Jost"
                    color: "#FFFFFF"
                    text: qsTr(percentageOfLearned + " %")
                }
                Text {
                    anchors.right: status.right
                    anchors.top: status.bottom
                    anchors.topMargin: 10
                    font.pixelSize: 15
                    font.family: "Jost"
                    color: "#FFFFFF"
                    text: qsTr("100 %")
                }

            }
        }
        Rectangle{
            height: 43
            Rectangle{
                id: list
                height: parent.height
                width: profilePage.rowWidth
                radius: layout.radius
                color: "#4E7CE2"

                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 5
                    font.pixelSize: 15
                    font.family: "Jost"
                    color: "#FFFFFF"
                    text: qsTr("Ваш уровень изучения ЯП")
                }
                CircleWithText{
                    text: countOfLanguages
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: listButton.left
                }

                TriangleButton{
                    id: listButton
                    x: 0
                    y: 0
                    height: parent.height
                    width: height
                    triangleWidth: 20
                    triangleHeight: 20
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: showList.trigger()
                }
            }
        }

        Item{
            width: number.width
            height: number.paintedHeight
            Text {
                id: text
                font.pixelSize: 20
                font.family: "Jost"
                color: isDark ? "white" : "black"
                text: qsTr("ID пользователя")
            }
        }

        Item{
            width: number.width
            height: number.paintedHeight
            Text {
                font.pixelSize: 16
                font.family: "Jost"
                color: isDark ? "#878787" : "#CFCFCF"
                text: qsTr(userId)
            }
        }
    }
}


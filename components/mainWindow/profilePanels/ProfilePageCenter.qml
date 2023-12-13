import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 2.12

Rectangle{
    id: profilePageCenter
    anchors.fill: parent
    color: isDark ? backgroundColor : whiteBackgroundColor
    property int rowWidth: width / 1.125

    property int percentageOfLearned: partOfLearned * 100

    property string userId: "11566874618"//parent.userId

    Rectangle  {
        id: layout
        width: rowWidth
        height: parent.height
        property int radius1: 20
        anchors.horizontalCenter: parent.horizontalCenter
        color: isDark ? backgroundColor : whiteBackgroundColor

        Image {
            id: image
            width: parent.height * 0.3
            height: parent.height * 0.3
            source: "qrc:/assets/images/profileImages/EmptyIcon.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: fio
            anchors.top: image.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: (parent.height + parent.width * 0.2) * 0.05
            font.underline: true
            color: isDark ? "white" : "black"
            font.family: "Jost"
            text: qsTr(userName)
        }
        Text{
            anchors.top: fio.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            id: number
            font.pixelSize: (parent.height + parent.width * 0.2) * 0.03
            color: isDark ? "white" : "black"
            font.family: "Jost"
            text: qsTr(userNumber)
        }
        Item{
            id: duo
            anchors.top: number.bottom

            height: parent.height * 0.1
            width: profilePage.rowWidth
            Rectangle{
                id: startField
                height: parent.height
                width: profilePage.rowWidth / 2
                radius: layout.radius1
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
                            font.pixelSize: (layout.height + layout.width * 0.2) * 0.03
                            font.family: "Jost"
                            text: qsTr("Start")
                        }
                    }
                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Text {
                            Layout.alignment: Qt.Top
                            font.pixelSize: (layout.height + layout.width * 0.2) * 0.03
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
                radius: layout.radius1
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
                            font.pixelSize: (layout.height + layout.width * 0.2) * 0.03
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
                            font.pixelSize: (layout.height + layout.width * 0.2) * 0.03
                            font.family: "Jost"
                            text: qsTr(userScore + " баллов")
                        }
                    }
                }

            }
        }
        Item{
            height: 80
            anchors.topMargin: 2

            id: big
            anchors.top: duo.bottom
            Rectangle{
                height: parent.height
                width: profilePage.rowWidth
                radius: layout.radius1
                color: "#4E7CE2"
                Text {
                    anchors.left: status.left
                    anchors.bottom: status.top
                    anchors.bottomMargin: 10
                    font.pixelSize: (layout.height + layout.width * 0.2) * 0.03
                    font.family: "Jost"
                    color: "#FFFFFF"
                    text: qsTr("Уровень изучения ЯП")
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
                    font.pixelSize: (layout.height + layout.width * 0.2) * 0.03
                    font.family: "Jost"
                    color: "#FFFFFF"
                    text: qsTr(percentageOfLearned + " %")
                }
                Text {
                    anchors.right: status.right
                    anchors.top: status.bottom
                    anchors.topMargin: 10
                    font.pixelSize: (layout.height + layout.width * 0.2) * 0.03
                    font.family: "Jost"
                    color: "#FFFFFF"
                    text: qsTr("100 %")
                }

            }
        }
        CourceList{
            id: l
            anchors.topMargin: 2
            anchors.top: big.bottom
            height: parent.height * 0.1
            width: profilePage.rowWidth
            color: "#4E7CE2"
            fsize: (layout.height + layout.width * 0.2) * 0.03
        }

    }

}


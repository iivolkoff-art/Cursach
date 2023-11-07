import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 2.12
import 'qrc:/components/mainWindow'

Item{
    id: profilePage
    property int constHeight: 640
    property int constWidth: 480
    property int heightCircle: (height / constHeight) * constHeight * 0.5
    property int widthCircle: (height / constHeight) * constHeight * 0.5
    property int w: width / 1.125

    property string userName: "Ваше имя"
    property string userNumber: "+375 (33) 635-22-45"

    property int userScore: 0
    property double partOfLearned: 0.30
    property int percentageOfLearned: partOfLearned * 100

    property int countOfLanguages: 2



    Rectangle{
        anchors.fill: parent
        color: "white"

        ColumnLayout  {
            id: layout
            width: w
            height: parent.height
            property int radius: 20
            spacing: 3
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: image
                width: parent.heightCircle
                height: parent.heightCircle
                source: "qrc:/assets/images/buttonPanelImages/BlueProfile.png"
                Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            }
            Rectangle{
                Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                width: name.width
                height: name.paintedHeight
                Text {
                    id: name
                    font.pixelSize: 25
                    font.family: "Jost"
                    text: qsTr(userName)
                }
            }
            Rectangle{
                Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                width: number.width
                height: number.paintedHeight
                Text {
                    id: number
                    font.pixelSize: 15
                    font.family: "Jost"
                    text: qsTr(userNumber)
                }
            }

            Rectangle{
                height: 50
                width: profilePage.w
                Rectangle{
                    id: startField
                    height: parent.height
                    width: profilePage.w / 2
                    radius: layout.radius
                    color: "#4E7CE2"
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        x: startField.y + 10
                        font.pixelSize: 15
                        font.family: "Jost"
                        text: qsTr("Start" + "\n" + "1 язык")
                    }

                    Rectangle{
                        height: 25
                        width: 25
                        radius: width / 2
                        color: "#BACFFF"
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.topMargin: 4
                        anchors.rightMargin: 7
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            x: startField.y + 10
                            font.pixelSize: 10
                            font.family: "Jost"
                            text: qsTr(percentageOfLearned + "%")
                        }
                    }
                }
                Rectangle{
                    id: points
                    anchors.left: startField.right
                    height: parent.height
                    width: profilePage.w / 2
                    radius: layout.radius
                    color: "#4E7CE2"
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        x: startField.y + 10
                        font.pixelSize: 15
                        font.family: "Jost"
                        text: qsTr("Баллы\n" + userScore + " баллов")
                    }
                }
            }
            Rectangle{
                height: 80
                Rectangle{
                    height: parent.height
                    width: profilePage.w
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
                        color: "#FFFFFF"
                        Rectangle{
                            height: parent.height
                            width: parent.width * partOfLearned
                            radius: parent.radius
                            color: "#BACFFF"
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
                    width: profilePage.w
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

                    Rectangle{
                        height: 25
                        width: 25
                        radius: width / 2
                        color: "#BACFFF"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: listButton.left
//                        anchors.rightMargin: 2
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
//                            x: startField.y + 10
                            font.pixelSize: 10
                            font.family: "Jost"
//                            text: qsTr(countOfLanguages)
                            text: qsTr("2")
                        }
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
            Text {
                id: id
                font.pixelSize: 20
                font.family: "Jost"
                text: qsTr("ID пользователя")
            }
            Text {
                id: id_number
                anchors.top: id.bottom
                font.pixelSize: 16
                font.family: "Jost"
                color: "#CFCFCF"
                text: qsTr("289367584")
            }
        }
    }
}

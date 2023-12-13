import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Rectangle{
    id: settingPanel
    anchors.fill: parent
    color: isDark ? backgroundColor : whiteBackgroundColor
    property bool isContactInfoShown: false

    Item {
        height: parent.height * 0.1
        id: tabs
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        Row {
            spacing: 5
            anchors.fill: parent

            Rectangle {
                id: myDataTab
                width : parent.width / 2
                height : parent.height
                visible: true
                color : myDataContent.visible ? "lightgrey" : "lightblue"
                Text {
                    anchors.centerIn: parent
                    text : "Мои данные"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked : {
                        isContactInfoShown = false
                    }
                }
            }

            Rectangle {
                id: contactDataTab
                width : parent.width / 2
                height : parent.height
                visible: true
                color : contactDataContent.visible ? "lightgrey" : "lightblue"
                Text {
                    anchors.centerIn: parent
                    text : "Контактные данные"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked : {
                        isContactInfoShown = true
                    }
                }
            }
         }
    }
    Rectangle {
        id: contentArea
        width : parent.width
        anchors.top: tabs.bottom
        anchors.horizontalCenter : parent.horizontalCenter
        height : parent.height * 0.5
        color: isDark ? backgroundColor : whiteBackgroundColor
        Rectangle {
            id: myDataContent
            width: parent.width
            height: parent.height
            anchors.top : parent.top
            anchors.left : parent.left
            anchors.right : parent.right
            visible : !isContactInfoShown

            Rectangle{
                id: filds
                anchors.fill: parent
                anchors.margins: (parent.width + parent.height) * 0.01
                color: "transparent"
                Rectangle{
                    id: name
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.6
                    height: parent.height * 0.2
                    color: "transparent"
                    TextField{
                        anchors.fill: parent
                        font.pixelSize: parent.height * 0.65
                        color: isDark ? "white" : "black"
                        placeholderText: "Имя"
                    }
                }
                Rectangle{
                    id: lastName
                    anchors.top: name.bottom
                    anchors.topMargin: (parent.width + parent.height) * 0.01
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.6
                    height: parent.height * 0.2
                    TextField{
                        anchors.fill: parent
                        font.pixelSize: parent.height * 0.65
                        color: isDark ? "white" : "black"
                        placeholderText: "Фамилия"
                    }
                }
                Rectangle{
                    id: mail
                    anchors.top: lastName.bottom
                    anchors.topMargin: (parent.width + parent.height) * 0.01
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.6
                    height: parent.height * 0.2
                    TextField{
                        anchors.fill: parent
                        font.pixelSize: parent.height * 0.65
                        color: isDark ? "white" : "black"
                        placeholderText: "Mail"
                    }
                }
            }
            Rectangle{
                anchors.top: filds.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                width: name.width
                height: name.height
                color: "red"
                radius: 15

                Text {
                    anchors.fill: parent
                    font.pixelSize: parent.height * 0.5
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: isDark ? "white" : "black"
                    text: "Сохранить изменения"
                }

                MouseArea {

                }
            }
        }
        Rectangle {
            id: contactDataContent
            width: parent.width
            height: parent.height / 3
            anchors.top : parent.top
            anchors.left : parent.left
            anchors.right : parent.right
            visible : isContactInfoShown
            //color: isDark ? backgroundColor : whiteBackgroundColor
            color: "white"

            TextField {
                id: number
                width: parent.width / 2
                anchors.top: parent.top
                placeholderText: "Номер телефона"
            }

            TextField {
                id: email
                width: parent.width / 2
                anchors.top: number.bottom
                anchors.bottom: parent.bottom
                placeholderText: "Электронная почта"
                anchors.topMargin: 5
            }
        }
     }



            Switch {
                id: sw1
                text: "Персональные предложения и акции"
                anchors.bottom : sw2.bottom
                anchors.bottomMargin : 30
                anchors.left : sw2.left
                    onToggled : {
                }
             }

            Switch {
                id: sw2
                text: "Тема"
                anchors.bottom : parent.bottom
                anchors.bottomMargin : 10
                anchors.horizontalCenter : parent.horizontalCenter
                onToggled : {
                    isDark = isDark ? false : true;
                    settingsManager.setSetting("appTheme", isDark.toString())
                 }
             }

            Text {
                text: "Выход"
                font.bold : true
                color : "blue"
                anchors.bottom : parent.bottom
                anchors.bottomMargin : 70
                anchors.horizontalCenter : parent.horizontalCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked : {
                windowsVisibleNumber = "2"
            }
        }
    }
}

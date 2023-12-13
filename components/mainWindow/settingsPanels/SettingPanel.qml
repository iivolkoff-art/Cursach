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
        Item {
            id: myDataContent
            anchors.fill : parent
            visible : !isContactInfoShown

            Column {
                anchors.centerIn: parent
                spacing : 10

                TextField {
                    placeholderText: "Фамилия"
                }

                TextField {
                    placeholderText: "Имя"
                }

                TextField {
                    placeholderText: "Отчество"
                 }
             }
        }
        Rectangle {
            id: contactDataContent
            anchors.fill : parent
            visible : isContactInfoShown

            anchors.centerIn: parent

            TextField {
                id: text1
                anchors.top: parent.top
                placeholderText: "Номер телефона"
                height: parent.height * 0.33
            }

            TextField {
                id: text2
                anchors.top: text1.bottom
                placeholderText: "Электронная почта"
                height: parent.height * 0.33
                anchors.topMargin: 5
            }

            TextField {
                anchors.top: text2.bottom
                anchors.bottom: parent.bottom
                placeholderText: "Дата рождения"
                height: parent.height * 0.33
                anchors.topMargin: 5
            }
        }
     }



            Switch {
                text: "Персональные предложения и акции"
                anchors.bottom : parent.bottom
                anchors.bottomMargin : 30
                anchors.horizontalCenter : parent.horizontalCenter
                    onToggled : {
                }
             }

            Switch {
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
                // Код
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Rectangle{
    id: settingPanel
    anchors.fill: parent
    color: isDark ? backgroundColor : whiteBackgroundColor
    Row {
        spacing: 5

        Rectangle {
            id: myDataTab
            width : parent.width / 2
            height : 300
            visible: true
            color : myDataContent.visible ? "lightblue" : "lightgrey"
            Text {
                anchors.centerIn: parent
                text : "Мои данные"
            }
            MouseArea {
                anchors.fill: parent
                onClicked : {
                    myDataContent.visible = true
                    contactDataContent.visible = false
                }
            }
        }

        Rectangle {
            id: contactDataTab
            width : parent.width / 2
            height : 300
            visible: true
            color : contactDataContent.visible ? "lightblue" : "lightgrey"
            Text {
                anchors.centerIn: parent
                text : "Контактные данные"
            }
            MouseArea {
                anchors.fill: parent
                onClicked : {
                    contactDataContent.visible = true
                    myDataContent.visible = false
                }
            }
        }
     }

    Rectangle {
        id: contentArea
        width : parent.width
        height : 200

        // Контент для вкладки "Мои данные"
        Item {
            id: myDataContent
            anchors.fill : parent
            visible : myDataTab.active

            Column {
                anchors.centerIn: parent
                spacing : 10

                TextField {
                    placeholderText: "Номер телефона"
                    // Дополнительные настройки для поля ввода
                }

                TextField {
                    placeholderText: "Электронная почта"
                    // Дополнительные настройки для поля ввода
                }

                TextField {
                    placeholderText: "Дата рождения"
                    // Дополнительные настройки для поля ввода
                }
            }
        }

        // Контент для вкладки "Контактные данные"
        Item {
            id: contactDataContent
            anchors.fill : parent
            visible : contactDataTab.active

            Column {
                anchors.centerIn: parent
                spacing : 10

                TextField {
                    placeholderText: "Фамилия"
                    // Дополнительные настройки для поля ввода
                }

                TextField {
                    placeholderText: "Имя"
                    // Дополнительные настройки для поля ввода
                }

                TextField {
                    placeholderText: "Отчество"
                    // Дополнительные настройки для поля ввода
                 }
             }
         }
     }



            Switch {
                text: "Персональные предложения и акции"
                anchors.bottom : parent.bottom
                anchors.bottomMargin : 30
                anchors.horizontalCenter : parent.horizontalCenter
                    // Обработчик изменения состояния переключателя
                    onToggled : {
                        myDataContent.visible = true
                        contactDataContent.visible = false
                }
             }

            Switch {
                text: "Тема"
                anchors.bottom : parent.bottom
                anchors.bottomMargin : 10
                anchors.horizontalCenter : parent.horizontalCenter
                // Обработчик изменения состояния переключателя
                onToggled : {
                    contactDataContent.visible = true
                    myDataContent.visible = false
                 }
             }

            Text {
                text: "Выход"
                font.bold : true
                color : "blue"
                anchors.bottom : parent.bottom
                anchors.bottomMargin : 70
                anchors.horizontalCenter : parent.horizontalCenter
                // Обработчик нажатия на текст "Выход"
                MouseArea {
                    anchors.fill: parent
                    onClicked : {
                // Ваш код для выхода
            }
        }
    }
}

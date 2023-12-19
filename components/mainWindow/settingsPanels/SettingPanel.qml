import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import accountManager

Rectangle{
    AccountManager{
        id: accountManager
    }
    property string fname: fnameField.text
    property string sname: snameField.text
    property string tname: tnameField.text
    property string tel: number.text
    property string em: email.text
    property string fnameText: accountManager.getFirstNameFromJson()
    property string snameText: accountManager.getSecondNameFromJson()
    property string tnameText: accountManager.getThirdNameFromJson()
    property string telText: accountManager.getTelephoneFromJson()
    property string emText: accountManager.getEmailFromJson()
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

            color: isDark ? backgroundColor : whiteBackgroundColor

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
                        id: fnameField
                        anchors.fill: parent
                        font.pixelSize: parent.height * 0.65
                        placeholderText: "Имя"
                        text: fnameText
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
                        id: snameField
                        anchors.fill: parent
                        font.pixelSize: parent.height * 0.65
                        placeholderText: "Фамилия"
                        text: snameText
                    }
                }
                Rectangle{
                    id: thirdName
                    anchors.top: lastName.bottom
                    anchors.topMargin: (parent.width + parent.height) * 0.01
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.6
                    height: parent.height * 0.2
                    TextField{
                        id: tnameField
                        anchors.fill: parent
                        font.pixelSize: parent.height * 0.65
                        placeholderText: "Отчество"
                        text: tnameText
                    }
                }
            }
        }
        Rectangle {
            id: contactDataContent
            width: parent.width
            height: parent.height
            anchors.top : parent.top
            anchors.left : parent.left
            anchors.right : parent.right
            visible : isContactInfoShown
            color: isDark ? backgroundColor : whiteBackgroundColor

            Rectangle{
                id: filds2
                anchors.fill: parent
                anchors.margins: (parent.width + parent.height) * 0.01
                color: "transparent"
                Rectangle{
                    id: telephoneRect
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.6
                    height: parent.height * 0.2
                    color: "transparent"
                    TextField{
                        id: number
                        anchors.fill: parent
                        font.pixelSize: parent.height * 0.65
                        placeholderText: "Номер телефона"
                        text: telText
                    }
                }
                Rectangle{
                    id: emailRect
                    anchors.top: telephoneRect.bottom
                    anchors.topMargin: (parent.width + parent.height) * 0.01
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.6
                    height: parent.height * 0.2
                    TextField{
                        id: email
                        anchors.fill: parent
                        font.pixelSize: parent.height * 0.65
                        placeholderText: "Электронная почта"
                        text: emText
                    }
                }
            }
        }
     }
    Rectangle{
        anchors.top: contentArea.bottom
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
            anchors.fill: parent
            onClicked: {
                submit();
            }
        }
    }
            Item {
                id: sw1
                width: 300
                height: 20
                anchors.bottom : sw2.bottom
                anchors.bottomMargin : 30
                anchors.left : sw2.left

                Row {
                        spacing: 10

                        Text {
                            text: "Персональные предложения и акции"
                            color: isDark ? "white" : "black"
                            verticalAlignment: Text.AlignVCenter
                            width: contentWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.horizontalCenter
                        }

                        Switch {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.horizontalCenter
                        }
                    }
            }
            Item {
                id: sw2
                width: 10
                height: 20
                anchors.bottom : sw3.bottom
                anchors.bottomMargin : 30
                anchors.left : sw3.left

                Row {
                        spacing: 10

                        Text {
                            text: "Темная тема"
                            color: isDark ? "white" : "black"
                            verticalAlignment: Text.AlignVCenter
                            width: contentWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.horizontalCenter
                        }

                        Switch {
                            anchors.verticalCenter: parent.verticalCenter // Выравнивание переключателя по вертикали
                            anchors.left: parent.horizontalCenter // Установка переключателя слева от горизонтального центра
                            checked: isDark
                            onToggled : {
                                isDark = isDark ? false : true;
                                settingsManager.setSetting("appTheme", isDark.toString())
                            }
                        }
                    }
            }
            Item {
                id: sw3
                width: 10
                height: 20
                anchors.bottom : parent.bottom
                anchors.bottomMargin : 5
                anchors.horizontalCenter : parent.horizontalCenter

                Row {
                        spacing: 10

                        Text {
                            text: "Принудительная тема"
                            color: isDark ? "white" : "black"
                            verticalAlignment: Text.AlignVCenter
                            width: contentWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.horizontalCenter
                        }

                        Switch {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.horizontalCenter
                            checked: isForcedTheme
                            onToggled : {
                                isForcedTheme = isForcedTheme ? false : true;
                                settingsManager.setSetting("forcedTheme", isForcedTheme.toString())
                            }
                        }
                    }
            }

            Text {
                text: "Выход"
                font.bold : true
                color : isDark ? "white" : "blue"
                anchors.bottom : parent.bottom
                anchors.right : parent.right
                anchors.bottomMargin : 20
                anchors.rightMargin : 20
                font.underline: true
                font.pixelSize: 16
                MouseArea {
                    anchors.fill: parent
                    onClicked : {
                        windowsVisibleNumber = "2"
                        mainVisibleWindows = "3"
                        mainBottomPanel.visibleCircleBorder = "3"
                    }
        }
    }
    function submit(){
        accountManager.setData(accountLogin.toString(), fname.toString(), sname.toString(), tname.toString(), tel.toString(), em.toString());
    }
}

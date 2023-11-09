import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Item {
    id: authorizationPanelMiddle
    property color baseColor: isDark ? whiteBackgroundColor : backgroundColor
    property color backColor: isDark ? backgroundColor : whiteBackgroundColor

    property string loginInput: loginTextField.text
    property string passwordInput: passwordTextField.text
    property color darkBlue: "#4E7CE2"
    property color lightBlue: "#BACFFF"
    property color backgroundGray: "#424242"

    property int formRadius: 15
    property int formBorderWidth: 2

    property bool passwordShown: false

    Rectangle {
        id: authForm
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0.1525 * parent.height
        radius: formRadius
        border.width: formBorderWidth
        color: isDark ? backColor : whiteBackgroundColor

        height: parent.height * 0.38375
        width: parent.width

        Rectangle {
            id: loginPanelButton
            anchors.top: parent.top
            anchors.left: parent.left
            width: parent.width / 2
            height: parent.height * 0.163
            radius: formRadius
            border.width: formBorderWidth

            color: darkBlue

            Rectangle {
                anchors.right: loginPanelButton.right
                anchors.top: loginPanelButton.top
                anchors.topMargin: parent.border.width
                anchors.bottom: loginPanelButton.bottom
                width: loginPanelButton.radius

                color: darkBlue
            }
            Rectangle {
                anchors.right: loginPanelButton.right
                anchors.left: loginPanelButton.left
                anchors.leftMargin: parent.border.width
                anchors.bottom: loginPanelButton.bottom
                height: loginPanelButton.radius

                color: darkBlue
            }

            Text {
                anchors.fill: parent
                text: "Авторизация"
                font.family: "Jost"
                color: "white"
                font.pixelSize: (parent.height + parent.width * 0.2) * 0.15

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            MouseArea {
                anchors.fill: parent
                onClicked: { isRegistering = false; }
            }
        }



        Rectangle {
            id: registerPanelButton
            anchors.top: parent.top
            anchors.left: loginPanelButton.right
            width: parent.width / 2
            height: parent.height * 0.163
            radius: formRadius
            border.width: formBorderWidth

            color: lightBlue

            Rectangle {
                anchors.left: registerPanelButton.left
                anchors.top: registerPanelButton.top
                anchors.topMargin: parent.border.width
                anchors.bottom: registerPanelButton.bottom
                width: registerPanelButton.radius

                color: lightBlue
            }
            Rectangle {
                anchors.right: registerPanelButton.right
                anchors.left: registerPanelButton.left
                anchors.rightMargin: parent.border.width
                anchors.bottom: registerPanelButton.bottom
                height: registerPanelButton.radius

                color: lightBlue
            }

            Text {
                anchors.fill: parent
                text: "Регистрация"
                font.family: "Jost"
                color: "black"
                font.pixelSize: (parent.height + parent.width * 0.2) * 0.15

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            MouseArea {
                anchors.fill: parent
                onClicked: { isRegistering = true; }
            }
        }

        Text {
            id: loginLabel
            color: darkBlue
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 18
            anchors.top: loginPanelButton.bottom
            anchors.topMargin: parent.height * 0.06

            text: "Логин"
            font.bold: true
            font.pixelSize: (parent.height + parent.width * 0.2) * 0.05
        }

        Rectangle {
            id: loginTextFieldPanel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: loginLabel.bottom

            radius: 10
            width: parent.width * 0.88
            height: parent.height * 0.153

            border.color: darkBlue
            border.width: 2
            color: isDark ? backgroundGray : "white"

            TextInput {
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
                font.pixelSize: (parent.width * 0.2 + parent.height) * 0.08
                color: authorizationPanelMiddle.baseColor
            }
        }

        Text {
            id: passwordLabel
            color: darkBlue
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 18
            anchors.top: loginTextFieldPanel.bottom
            anchors.topMargin: parent.height * 0.03257

            text: "Пароль"
            font.bold: true
            font.pixelSize: (parent.height + parent.width * 0.2) * 0.05
        }

        Rectangle {
            id: passwordTextFieldPanel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: passwordLabel.bottom

            radius: 10
            width: parent.width * 0.88
            height: parent.height * 0.153

            border.color: darkBlue
            border.width: 2
            color: isDark ? backgroundGray : "white"

            TextInput {
                id: passwordTextField
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
                font.pixelSize: (parent.width * 0.2 + parent.height) * 0.08
                color: baseColor
                echoMode: !passwordShown ? TextInput.Password : TextInput.Normal
            }
        }

        Rectangle {
            id: passwordVisibilityButton
            anchors.left: passwordTextFieldPanel.right
            anchors.verticalCenter: passwordTextFieldPanel.verticalCenter
            anchors.leftMargin: passwordTextFieldPanel.width * 0.01

            width: radius
            height: radius
            radius:  (passwordTextFieldPanel.height + passwordTextFieldPanel.width * 0.2) * 0.15

            color: authorizationPanelMiddle.backColor

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    passwordShown = !passwordShown;
                }
            }
            Image {
                anchors.centerIn: parent
                source: (!authorizationPanelMiddle.passwordShown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedDark" : (authorizationPanelMiddle.passwordShown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeOpenDark" : (!authorizationPanelMiddle.passwordShown && !isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedLight" : "qrc:/assets/images/passwordVisibilityImages/eyeOpenLight"
                width: parent.width * 0.75
                height: width * 0.7063
             }
        }

        Text {
            id: registerNewLabel
            color: isDark ? "white" : "black"
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 18
            anchors.top: passwordTextFieldPanel.bottom
            anchors.topMargin: parent.height * 0.06

            text: "У Вас ещё нет аккаунта?"
            font.bold: true
            font.pixelSize: (parent.height + parent.width * 0.2) * 0.0375
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: registerButton
            anchors.right: parent.right
            anchors.rightMargin: parent.width / 18
            anchors.top: passwordTextFieldPanel.bottom
            anchors.topMargin: parent.height * 0.06

            height: parent.height / 10

            text: "Зарегистрироваться"

            contentItem: Text {
                text: parent.text
                font.bold: true
                font.underline: true
                font.pixelSize: (authForm.height + authForm.width * 0.2) * 0.0375
                opacity: enabled ? 1.0 : 0.3
                color: darkBlue
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            flat: true
            background: Rectangle {
                visible: false
            }

            onClicked: {
                isRegistering = true;
            }
        }
    }

    Button {
        id: submitButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: authorizationPanelMiddle.bottom
        anchors.bottomMargin: authorizationPanelMiddle.height * 0.2225

        width: parent.width * 0.89
        height: parent.height * 0.06875

        text: "Войти"

        contentItem: Text {
            text: parent.text
            font.bold: true
            font.pixelSize: (parent.width * 0.2 + parent.height) * 0.1
            opacity: enabled ? 1.0 : 0.3
            color: whiteBackgroundColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        flat: true
        background: Rectangle {
            opacity: enabled ? 1 : 0.3
            radius: 20
            color: darkBlue
        }

        onClicked: { submitAuthorization(); }
    }

    Button {
        id: forgotPasswordButton
        anchors.top: submitButton.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.height * 0.03257

        text: "Забыли пароль?"

        contentItem: Text {
            text: parent.text
            font.bold: true
            font.underline: true
            opacity: enabled ? 1.0 : 0.3
            color: darkBlue
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        flat: true
        background: Rectangle {
            visible: false
        }
    }

    function submitAuthorization()
    {
        windowsVisibleNumber = 0;
    }
}

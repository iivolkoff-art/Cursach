import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import loginManager

Item {
    id: registrationPanel
    property color baseColor: isDark ? whiteBackgroundColor : backgroundColor
    property color backColor: isDark ? backgroundColor : whiteBackgroundColor

    property string registerInput: registerTextField.text
    property string passwordInput: passwordTextField.text
    property string password2Input: password2TextField.text
    property string emailInput: emailTextField.text
    property color darkBlue: "#4E7CE2"
    property color lightBlue: "#BACFFF"
    property color backgroundGray: "#424242"

    property int formRadius: 15
    property int formBorderWidth: 2

    property bool passwordShown: false
    property bool password2Shown: false
    property bool passwordErrorShown: false

    LoginManager{
        id: loginManager
    }

    Rectangle {
        id: registerForm
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0.1525 * parent.height
        radius: formRadius
        border.width: formBorderWidth
        color: isDark ? backColor : whiteBackgroundColor
        border.color: "#4E7CE2"

        height: parent.height * 0.67125
        width: parent.width

        Rectangle {
            id: loginPanelButton
            anchors.top: parent.top
            anchors.left: parent.left
            width: parent.width / 2
            height: parent.height * 0.163 * 0.57169
            radius: formRadius
            border.width: formBorderWidth
            border.color: "#4E7CE2"
            color: lightBlue

            Rectangle {
                anchors.right: loginPanelButton.right
                anchors.top: loginPanelButton.top
                anchors.topMargin: parent.border.width
                anchors.bottom: loginPanelButton.bottom
                width: loginPanelButton.radius

                color: lightBlue
            }
            Rectangle {
                anchors.right: loginPanelButton.right
                anchors.left: loginPanelButton.left
                anchors.leftMargin: parent.border.width
                anchors.bottom: loginPanelButton.bottom
                height: loginPanelButton.radius

                color: lightBlue
            }

            Text {
                anchors.fill: parent
                text: "Авторизация"
                font.family: "Jost"
                color: "black"
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
            height: parent.height * 0.163 * 0.57169
            radius: formRadius
            border.width: formBorderWidth
            border.color: "#4E7CE2"

            color: darkBlue

            Rectangle {
                anchors.left: registerPanelButton.left
                anchors.top: registerPanelButton.top
                anchors.topMargin: parent.border.width
                anchors.bottom: registerPanelButton.bottom
                width: registerPanelButton.radius

                color: darkBlue
            }
            Rectangle {
                anchors.right: registerPanelButton.right
                anchors.left: registerPanelButton.left
                anchors.rightMargin: parent.border.width
                anchors.bottom: registerPanelButton.bottom
                height: registerPanelButton.radius

                color: darkBlue
            }

            Text {
                anchors.fill: parent
                text: "Регистрация"
                font.family: "Jost"
                color: "white"
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
            id: registerLabel
            color: darkBlue
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 18
            anchors.top: registerPanelButton.bottom
            anchors.topMargin: parent.height * 0.06 * 0.57169

            text: "Логин"
            font.bold: true
            font.pixelSize: (parent.height * 0.57169 + parent.width * 0.2) * 0.05
        }

        Rectangle {
            id: registerTextFieldPanel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: registerLabel.bottom

            radius: 10
            width: parent.width * 0.88
            height: parent.height * 0.153 * 0.57169

            border.color: darkBlue
            border.width: 2
            color: isDark ? backgroundGray : "white"

            TextInput {
                id: registerTextField
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
                font.pixelSize: (parent.width * 0.2 + parent.height) * 0.08
                color: registrationPanel.baseColor
                focus: authWindow.isRegistering ? true : false
            }
        }

        Text {
            id: emailLabel
            color: darkBlue
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 18
            anchors.top: registerTextFieldPanel.bottom
            anchors.topMargin: parent.height * 0.06 * 0.57169

            text: "Электронная почта"
            font.bold: true
            font.pixelSize: (parent.height * 0.57169 + parent.width * 0.2) * 0.05
        }

        Rectangle {
            id: emailTextFieldPanel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: emailLabel.bottom

            radius: 10
            width: parent.width * 0.88
            height: parent.height * 0.153 * 0.57169

            border.color: darkBlue
            border.width: 2
            color: isDark ? backgroundGray : "white"

            TextInput {
                id: emailTextField
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
                font.pixelSize: (parent.width * 0.2 + parent.height) * 0.08
                color: registrationPanel.baseColor
                focus: authWindow.isRegistering ? true : false
            }
        }

        Text {
            id: passwordLabel
            color: darkBlue
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 18
            anchors.top: emailTextFieldPanel.bottom
            anchors.topMargin: parent.height * 0.03257 * 0.57169

            text: "Пароль"
            font.bold: true
            font.pixelSize: (parent.height * 0.57169 + parent.width * 0.2) * 0.05
        }

        Rectangle {
            id: passwordTextFieldPanel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: passwordLabel.bottom

            radius: 10
            width: parent.width * 0.88
            height: parent.height * 0.153 * 0.57169

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
                focus: authWindow.isRegistering ? true : false
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

            color: registrationPanel.backColor

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    passwordShown = !passwordShown;
                }
            }
            Image {
                anchors.centerIn: parent
                source: (!registrationPanel.passwordShown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedDark" : (registrationPanel.passwordShown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeOpenDark" : (!registrationPanel.passwordShown && !isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedLight" : "qrc:/assets/images/passwordVisibilityImages/eyeOpenLight"
                width: parent.width * 0.75
                height: width * 0.7063
             }
        }

        Text {
            id: password2Label
            color: darkBlue
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 18
            anchors.top: passwordTextFieldPanel.bottom
            anchors.topMargin: parent.height * 0.03257 * 0.57169

            text: "Подтвердите пароль"
            font.bold: true
            font.pixelSize: (parent.height * 0.57169 + parent.width * 0.2) * 0.05
        }

        Rectangle {
            id: password2TextFieldPanel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: password2Label.bottom

            radius: 10
            width: parent.width * 0.88
            height: parent.height * 0.153 * 0.57169

            border.color: darkBlue
            border.width: 2
            color: isDark ? backgroundGray : "white"

            TextInput {
                id: password2TextField
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
                font.pixelSize: (parent.width * 0.2 + parent.height) * 0.08
                color: baseColor
                echoMode: !password2Shown ? TextInput.Password : TextInput.Normal
                focus: authWindow.isRegistering ? true : false
            }
        }

        Rectangle {
            id: password2VisibilityButton
            anchors.left: password2TextFieldPanel.right
            anchors.verticalCenter: password2TextFieldPanel.verticalCenter
            anchors.leftMargin: password2TextFieldPanel.width * 0.01

            width: radius
            height: radius
            radius:  (password2TextFieldPanel.height + password2TextFieldPanel.width * 0.2) * 0.15

            color: registrationPanel.backColor

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    password2Shown = !password2Shown;
                }
            }
            Image {
                anchors.centerIn: parent
                source: (!registrationPanel.password2Shown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedDark" : (registrationPanel.password2Shown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeOpenDark" : (!registrationPanel.password2Shown && !isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedLight" : "qrc:/assets/images/passwordVisibilityImages/eyeOpenLight"
                width: parent.width * 0.75
                height: width * 0.7063
             }
        }

        Text {
            id: alreadyRegisteredLabel
            color: isDark ? "white" : "black"
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 18
            anchors.top: passwordsDontMatchLabel.bottom
            anchors.topMargin: parent.height * 0.01 * 0.57169

            text: "Уже зарегистрированы?"
            font.bold: true
            font.pixelSize: (parent.height * 0.57169 + parent.width * 0.2) * 0.0375
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: registerButton
            anchors.right: parent.right
            anchors.rightMargin: parent.width / 18
            anchors.top: passwordsDontMatchLabel.bottom
            anchors.topMargin: parent.height * 0.01 * 0.57169

            height: parent.height / 10 * 0.57169

            text: "Войти в аккаунт"

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
                isRegistering = false;
            }
        }

        Text {
            id: passwordsErrorLabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: password2TextFieldPanel.bottom
            anchors.topMargin: parent.height * 0.06 * 0.57169

            font.bold: false
            font.pixelSize: (parent.height * 0.57169 + parent.width * 0.2) * 0.0375
            text: "Неправильно введена информация при регистрации!"
            color: "red"
            font.letterSpacing: -1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: passwordErrorShown
        }

        Text {
            id: passwordsDontMatchLabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: password2TextFieldPanel.bottom
            anchors.topMargin: parent.height * 0.06 * 0.57169

            font.bold: false
            font.pixelSize: (parent.height * 0.57169 + parent.width * 0.2) * 0.0375
            text: (password2TextField.text != passwordTextField.text && !passwordErrorShown) ? "Пароли не совпадают!" : ""
            color: "red"
            font.letterSpacing: -1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Button {
        id: submitButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: registrationPanel.bottom
        anchors.bottomMargin: registrationPanel.height * 0.0825

        width: parent.width * 0.89
        height: parent.height * 0.06875

        text: "Зарегистрироваться"

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

        onClicked: { submitRegistration(); }
    }

    function submitRegistration()
    {
        if ((password2TextField.text == passwordTextField.text && !loginManager.accountExists(registerInput.toString())) && (registerInput != "" && password2Input != "")) {
            loginManager.createAccount(registerInput, passwordInput, emailInput);
            isRegistering = false;
        }
        else {
            passwordErrorShown = true;
        }
    }
}

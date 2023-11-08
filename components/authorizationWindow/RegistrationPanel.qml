import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Item {
    id: registerPanel
    property color baseColor: isDark ? whiteBackgroundColor : backgroundColor
    property color backColor: isDark ? backgroundColor : whiteBackgroundColor

    property string loginInput: loginTextField.text
    property string passwordInput: passwordTextField.text
    property color placeholderColor: "#d3d3d3"

    property bool passwordShown: false
    property bool passwordRepeatShown: false

    Rectangle {
        anchors.fill: parent
        color: parent.backColor

        Text {
            id: titleText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height / 60;

            text: "Чтобы продолжить, \nзарегистрируйтесь"
            color: baseColor
            font.pixelSize: (parent.width + parent.height) * 0.03
            font.bold: true
            font.letterSpacing: -1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBaseline
        }

        Rectangle {
            id: loginTextFieldPanel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: titleText.bottom
            anchors.topMargin: parent.height / 10

            width: parent.width / 2.25
            height: parent.height / 13

            border.color: baseColor
            color: backColor

            TextInput {
                id: loginTextField
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
                font.pixelSize: (parent.width + parent.height) * 0.06
                color: baseColor


                property string placeholderText: "Придумайте логин..."

                Text {
                    anchors.fill: parent
                    text: placeholderText
                    color: isDark ? placeholderColor : Qt.darker(placeholderColor, 1.5)
                    font.pixelSize: (parent.width + parent.height) * 0.05
                    font.bold: false
                    font.letterSpacing: -1
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    visible: !loginTextField.text && !loginTextField.activeFocus
                }
            }
        }

        Rectangle {
            id: passwordTextFieldPanel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: loginTextFieldPanel.bottom
            anchors.topMargin: parent.height / 30

            width: parent.width / 2.25
            height: parent.height / 13

            border.color: baseColor
            color: backColor

            TextInput {
                id: passwordTextField
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
                font.pixelSize: (parent.width + parent.height) * 0.06
                color: baseColor
                echoMode: !passwordShown ? TextInput.Password : TextInput.Normal

                property string placeholderText: "Придумайте пароль..."

                Text {
                    anchors.fill: parent
                    text: placeholderText
                    color: isDark ? placeholderColor : Qt.darker(placeholderColor, 1.5)
                    font.pixelSize: (parent.width + parent.height) * 0.05
                    font.bold: false
                    font.letterSpacing: -1
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    visible: !passwordTextField.text && !passwordTextField.activeFocus
                }
            }
        }

        Rectangle {
            id: passwordVisibilityButton
            anchors.left: passwordTextFieldPanel.right
            anchors.verticalCenter: passwordTextFieldPanel.verticalCenter
            anchors.leftMargin: passwordTextFieldPanel.width * 0.05

            width: passwordTextFieldPanel.height * 0.8
            height: passwordTextFieldPanel.height * 0.8
            radius:  passwordTextFieldPanel.height * 0.8

            color: backColor

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    passwordShown = !passwordShown;
                }
            }
            Image {
                anchors.centerIn: parent
                source: (!passwordShown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedDark" : (passwordShown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeOpenDark" : (!passwordShown && !isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedLight" : "qrc:/assets/images/passwordVisibilityImages/eyeOpenLight"
                width: parent.width * 0.75
                height: width * 0.7063
             }
        }

        Rectangle {
            id: password2TextFieldPanel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: passwordTextFieldPanel.bottom
            anchors.topMargin: registerPanel.height / 30

            width: parent.width / 2.25
            height: parent.height / 13

            border.color: registerPanel.baseColor
            color: registerPanel.backColor

            TextInput {
                id: password2TextField
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
                font.pixelSize: (parent.width + parent.height) * 0.06
                color: registerPanel.baseColor
                echoMode: !passwordRepeatShown ? TextInput.Password : TextInput.Normal

                property string placeholderText: "Повторите введённый пароль..."

                Text {
                    anchors.fill: parent
                    text: password2TextField.placeholderText
                    color: isDark ? registerPanel.placeholderColor : Qt.darker(registerPanel.placeholderColor, 1.5)
                    font.pixelSize: (parent.width + parent.height) * 0.05
                    font.bold: false
                    font.letterSpacing: -1
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    visible: !password2TextField.text && !password2TextField.activeFocus
                }
            }
        }

        Rectangle {
            id: passwordRepeatVisibilityButton
            anchors.left: password2TextFieldPanel.right
            anchors.verticalCenter: password2TextFieldPanel.verticalCenter
            anchors.leftMargin: password2TextFieldPanel.width * 0.05

            width: password2TextFieldPanel.height * 0.8
            height: password2TextFieldPanel.height * 0.8
            radius:  password2TextFieldPanel.height * 0.8

            color: registerPanel.backColor

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    passwordRepeatShown = !passwordRepeatShown;
                }
            }
            Image {
                anchors.centerIn: parent
                source: (!registerPanel.passwordRepeatShown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedDark" : (registerPanel.passwordRepeatShown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeOpenDark" : (!registerPanel.passwordRepeatShown && !isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedLight" : "qrc:/assets/images/passwordVisibilityImages/eyeOpenLight"
                width: parent.width * 0.75
                height: width * 0.7063
             }
        }

        Text {
            id: doesntMatchText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: password2TextFieldPanel.bottom
            anchors.topMargin: parent.height / 60;

            text: password2TextField.text != passwordTextField.text ? "Пароли не совпадают!" : ""
            color: "red"
            font.pixelSize: (parent.width + parent.height) * 0.012
            font.bold: false
            font.letterSpacing: -1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBaseline
        }

        Button {
            id: registerButton
            anchors.bottom: submitButton.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: panel.height / 50

            width: parent.width / 2.25
            height: parent.height / 15

            text: "У меня уже есть аккаунт"

            contentItem: Text {
                text: parent.text
                font.bold: true
                opacity: enabled ? 1.0 : 0.3
                color: baseColor
                horizontalAlignment: Text.AlignHCenter
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

        Button {
            id: submitButton
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: parent.height / 30

            width: parent.width / 2.25
            height: parent.height / 13

            text: "ВОЙТИ"

            contentItem: Text {
                text: parent.text
                font.bold: true
                font.pixelSize: (parent.width + parent.height) * 0.055
                opacity: enabled ? 1.0 : 0.3
                color: whiteBackgroundColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            flat: true
            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                border.color: baseColor
                border.width: 1
                radius: 2
                color: "#4E7CE2"
            }

            onClicked: { submitRegistration(); }
        }
    }

    function submitRegistration()
    {
        isRegistering = false;
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Item {
    id: authPanel
    property color baseColor: isDark ? whiteBackgroundColor : backgroundColor
    property color backColor: isDark ? backgroundColor : whiteBackgroundColor

    property string loginInput: loginTextField.text
    property string passwordInput: passwordTextField.text
    property color placeholderColor: "#d3d3d3"

    property bool passwordShown: false

    Rectangle {
        anchors.fill: parent
        color: parent.backColor

        Text {
            id: titleText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height / 60;

            text: "Чтобы продолжить, \nвойдите в аккаунт"
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
            anchors.topMargin: authPanel.height / 10

            width: parent.width / 2.25
            height: parent.height / 13

            border.color: authPanel.baseColor
            color: authPanel.backColor

            TextInput {
                id: loginTextField
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
                font.pixelSize: (parent.width + parent.height) * 0.06
                color: authPanel.baseColor


                property string placeholderText: "Введите логин..."

                Text {
                    anchors.fill: parent
                    text: loginTextField.placeholderText
                    color: isDark ? authPanel.placeholderColor : Qt.darker(authPanel.placeholderColor, 1.5)
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
            anchors.topMargin: authPanel.height / 30

            width: parent.width / 2.25
            height: parent.height / 13

            border.color: authPanel.baseColor
            color: authPanel.backColor

            TextInput {
                id: passwordTextField
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                horizontalAlignment: TextInput.AlignHCenter
                font.pixelSize: (parent.width + parent.height) * 0.06
                color: baseColor
                echoMode: !passwordShown ? TextInput.Password : TextInput.Normal

                property string placeholderText: "Введите пароль..."

                Text {
                    anchors.fill: parent
                    text: passwordTextField.placeholderText
                    color: isDark ? authPanel.placeholderColor : Qt.darker(authPanel.placeholderColor, 1.5)
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

            color: authPanel.backColor

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    passwordShown = !passwordShown;
                }
            }
            Image {
                anchors.centerIn: parent
                source: (!authPanel.passwordShown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedDark" : (authPanel.passwordShown && isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeOpenDark" : (!authPanel.passwordShown && !isDark) ? "qrc:/assets/images/passwordVisibilityImages/eyeClosedLight" : "qrc:/assets/images/passwordVisibilityImages/eyeOpenLight"
                width: parent.width * 0.75
                height: width * 0.7063
             }
        }


        Button {
            id: forgotPasswordButton
            anchors.top: passwordTextFieldPanel.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: authPanel.height / 50

            width: parent.width / 2.25
            height: parent.height / 15

            text: "Забыли пароль?"

            contentItem: Text {
                text: parent.text
                font.bold: true
                opacity: enabled ? 1.0 : 0.3
                color: authPanel.baseColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            flat: true
            background: Rectangle {
                visible: false
            }
        }

        Button {
            id: registerButton
            anchors.bottom: submitButton.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: authPanel.height / 50

            width: parent.width / 2.25
            height: parent.height / 15

            text: "Создать аккаунт"

            contentItem: Text {
                text: parent.text
                font.bold: true
                opacity: enabled ? 1.0 : 0.3
                color: authPanel.baseColor
                horizontalAlignment: Text.AlignHCenter
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

        Button {
            id: submitButton
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: authPanel.height / 30

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
                border.color: authPanel.baseColor
                border.width: 1
                radius: 2
                color: "#4E7CE2"
            }

            onClicked: { submitAuthorization(); }
        }
    }

    function submitAuthorization()
    {
        windowsVisibleNumber = 0;
    }
}

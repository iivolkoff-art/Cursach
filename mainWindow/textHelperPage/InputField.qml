import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
    property string message: inputText.text
    id: inputField

    Rectangle {
        id: inputFieldRectangle
        anchors.fill: parent

        Rectangle {
            id: inputTextRectangle
            height: parent.height
            width: parent.width
            color: backgroundColor

            TextInput {
                id: inputText
                anchors.fill: parent
                anchors.leftMargin: 15
                color: "white"
                verticalAlignment: TextInput.AlignVCenter
                font.pixelSize: (parent.width + parent.height) * 0.04
                focus: mainVisibleWindows === "5" ? true : false


                Keys.onReturnPressed: {
<<<<<<< HEAD
=======
                    inputText.focus = false;
>>>>>>> bee127c79afba0fbff7f94f90cc4fd07a3ede3a8
                    chatField.message = inputText.text;
                    hideMarker();
                }
                Keys.onBackPressed: {
                    hideMarker();
                }

                Text {
                    text: "message"
                    color: "#aaa"
                    anchors.fill: parent
                    font.pixelSize: (parent.width + parent.height) * 0.04
                    verticalAlignment: Text.AlignVCenter
                    visible: !inputText.text && !inputText.activeFocus
                }
            }
        }
        Rectangle {
            id: line
            anchors.bottom: inputFieldRectangle.top
            height: 1
            width: parent.width
            color: "grey"
        }
    }

    function hideMarker() {
        inputText.text = "";
        inputText.focus = false;
    }

}

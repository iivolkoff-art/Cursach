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
            color: isDark ? backgroundColor : whiteBackgroundColor

            TextInput {
                id: inputText
                anchors.fill: parent
                anchors.leftMargin: 15
                color: isDark ? "white" : "black"
                verticalAlignment: TextInput.AlignVCenter
                font.pixelSize: (parent.width + parent.height) * 0.04
                focus: mainVisibleWindows === "5" ? true : false


                Keys.onReturnPressed: {
                    inputText.focus = false;
                    chatField.message = inputText.text;
                    inputText.text = "";
                    //hideMarker();
                }
                Keys.onBackPressed: {
                    hideMarker();
                }

                Text {
                    text: "message"
                    color: "#aaa"
                    anchors.fill: parent
                    font.pixelSize: parent.height * 0.4
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
            color: isDark ? "#FFFFFF" : "grey"
        }
    }

    function hideMarker() {
        inputText.focus = false;
    }

}

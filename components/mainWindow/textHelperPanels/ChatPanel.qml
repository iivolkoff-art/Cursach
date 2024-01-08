import QtQuick 2.15
import QtQuick.Controls 2.15
import networkChecker

Item {
    id: chatField
    property color messageColor: "#4166B7"
    property string message: ""
    property bool networkStatus: networkChecker.check()

    NetworkChecker{
        id: networkChecker
    }

    Rectangle{
        id: blockTextHelper
        anchors.fill: parent
        visible: !networkStatus
        color: isDark ? backgroundColor : whiteBackgroundColor
        z: 2
        Text{
            id: textConnectionStatus
            anchors.centerIn: parent
            color: isDark ? "white" : "black"
            text: "Сервер не отвечает"
            font.pixelSize: parent.height * 0.06
        }
    }

    Timer {
        id: repeatTimer
        interval: 5000
        running: mainVisibleWindows === "5"

        onTriggered: {
            networkStatus = networkChecker.check()
            console.log(networkStatus)
            repeatTimer.restart();
        }
    }

    ListModel {
        id: messageModel
    }

    ListView {
        id: chatListView
        anchors.fill: parent
        model: messageModel
        orientation: Qt.Vertical
        spacing: 5
        clip: true

        ScrollBar.vertical: ScrollBar {
            anchors.right: parent.right
            policy: ScrollBar.AlwaysOff
        }

        delegate: Rectangle {
            width: contentText.width
            height: contentText.height + 10
            color: isDark ? backgroundColor : whiteBackgroundColor

            Text {
                id: contentText
                text: model.messageText
                color: messageColor
                font.pixelSize: chatField.height * 0.05
                wrapMode: Text.WordWrap
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        onModelChanged: {
            chatListView.contentY = chatListView.contentHeight - chatListView.height;
        }

        onContentYChanged: {
            if (chatListView.contentY >= chatListView.contentHeight - chatListView.height){
                chatListView.contentY = chatListView.contentHeight - chatListView.height;
            }
        }
    }

    function sendMessage(text, textColor) {
        messageModel.append({ messageText: text, messageColor: textColor });
        chatListView.contentY = chatListView.contentHeight - chatListView.height;
        chatListView.positionViewAtIndex(messageModel.count - 1, ListView.End);
    }

    onMessageChanged: {
        if (message !== "" && networkStatus === true) {
            sendMessage(message, "#00DFFC"); // Пример сообщения с вашей стороны
            message = "";
            sendMessage(textHelper.getDataFromScripFroServer(), isDark ? "#D9D9D9" : "black");
        }
    }
}

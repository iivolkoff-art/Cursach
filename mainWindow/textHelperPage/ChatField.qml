import QtQuick 2.15
import QtQuick.Controls 2.15


Item {
    id: chatField
    property color messageColor: "#00DFFC"
    property string message: ""

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
            width: parent.width
            height: contentText.height + 10
            color: backgroundColor

            Text {
                id: contentText
                text: model.messageText
                color: messageColor
                font.pixelSize: 18
                wrapMode: Text.WordWrap
                anchors.left: parent.left
                anchors.leftMargin: 10 // Увеличим отступ слева для текста
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

    onMessageChanged: {
        if (message !== "") {
            messageModel.append({ messageText: message });
            chatListView.contentY = chatListView.contentHeight - chatListView.height;

            // Плавно прокрутим к последнему добавленному сообщению
            chatListView.positionViewAtIndex(messageModel.count - 1, ListView.End);

            message = "";
            messageColor = "#00DFFC";
        }
    }
}


import QtQuick 2.12
import QtQuick.Window 2.12

Item{
    id:topPanel
    Rectangle{
        anchors.fill: parent
        color: backgroundColor
        Rectangle{
            id: learnStatus
            anchors.centerIn: parent
            width: parent.width * 0.7
            height: parent.height * 0.2
            color: "green"
        }
    }
}

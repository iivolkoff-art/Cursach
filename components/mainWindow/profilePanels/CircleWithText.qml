import QtQuick 2.12

Rectangle{
    id: circleWithText
    height: 25
    width: 25
    radius: width / 2
    color: !isDark ? "#BACFFF" : "#92A8D9"

    property int pixelSize: 10
    property string fontFamily: "Jost"
    property string text: "Text"

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: parent.pixelSize
        font.family: parent.fontFamily
        text: qsTr(parent.text)
    }
}

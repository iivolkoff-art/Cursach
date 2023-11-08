import QtQuick 2.12

Item{
    width: text.width
    height: text.paintedHeight

    property int pixelSize: 20
    property string fontFamily: "Jost"
    property string text: "Text"
    Text {
        id: text
        font.pixelSize: parent.pixelSize
        font.family: parent.fontFamily
        text: qsTr(parent.text)
    }
}

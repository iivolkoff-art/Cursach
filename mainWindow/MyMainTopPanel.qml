import QtQuick 2.12
import QtQuick.Window 2.12

Item{
    id: mainTopPanel
    Rectangle{
           anchors.fill: parent
           color: backgroundColor
           Rectangle{
               anchors.left: parent.left
               anchors.verticalCenter: parent.verticalCenter
               anchors.leftMargin: parent.width * 0.01
               width: parent.height * 0.7
               height: parent.height * 0.7
               radius:  (parent.width + parent.height) * 0.3
               color: "#008C9E"
               Text {
                   anchors.centerIn: parent
                   text: "C++"
                   color: "white"
                   font.pixelSize: parent.height * 0.4
                   font.bold: true
                   font.letterSpacing: -1
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignBaseline
               }
           }
           Rectangle{
               id: pointSize
               anchors.right: parent.right
               anchors.verticalCenter: parent.verticalCenter
               anchors.top: parent.top
               anchors.bottom: parent.bottom
               width: star.width
               height: parent.height
               //anchors.rightMargin: parent.width * 0.001
               color: "transparent"
               //color: "red"
               Text{
                   id: star
                   anchors.verticalCenter: parent.verticalCenter
                   //anchors.left: points.right
                   anchors.right: parent.right
                   anchors.rightMargin: mainWindow.width * 0.03

                   text:"*"
                   font.pixelSize: parent.height * 0.4
                   color:  "#00B4CC"
               }
               Text{
                   id: points
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.right: star.left

                   text:"123"
                   font.pixelSize: parent.height * 0.4
                   color:  "white"
               }
           }

       }
       Rectangle {
           id: line
           anchors {
               left: parent.left
               right: parent.right
               bottom: parent.bottom
           }
           height: 1
           color: "#686F6F"
       }
}

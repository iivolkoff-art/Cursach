import QtQuick 2.12
import QtQuick.Window 2.12
import testsCreater


Item{
    id: mainTopPanel
    TestsCreater{
        id: testsCreater
    }


    Rectangle{
           anchors.fill: parent
           color: isDark ? backgroundColor : whitePanelColor
           Rectangle{
               id: programLang
               anchors.left: parent.left
               anchors.verticalCenter: parent.verticalCenter
               anchors.leftMargin: parent.width * 0.01
               width: parent.height * 0.7
               height: parent.height * 0.7
               radius:  (parent.width + parent.height) * 0.3
               color: Qt.rgba(255, 255, 255, 0.5)
               Text {
                   id: textLang
                   anchors.centerIn: parent
                   text: "C++"
                   color: "white"
                   font.pixelSize: parent.height * 0.4
                   font.bold: true
                   font.letterSpacing: -1
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignBaseline
                }
               MouseArea{
                   anchors.fill: parent
                   onClicked: {
                       testsCreater.getFilesFromServer()
                    }
               }
           }
           Image{
               id: imgPoint
              anchors.left: programLang.right
              anchors.leftMargin: parent.width * 0.03
              anchors.verticalCenter: parent.verticalCenter
              source: "qrc:/assets/images/topPanelImages/Points.png"
              width: parent.height * 0.4
              height: parent.height * 0.4
           }
           Rectangle{
               id: points
               anchors.left: imgPoint.right
               anchors.verticalCenter: parent.verticalCenter
               width: parent.height * 0.7
               anchors.leftMargin: parent.width * 0.02
               height: parent.height * 0.7
               color: "transparent" //transparent
               Text{
                   id: countPoints
                   anchors.centerIn: parent
                   anchors.verticalCenter: parent.verticalCenter
                   text: "12312"
                   color: "white"
                   font.pixelSize: parent.height * 0.4
                   font.bold: true
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignBaseline
               }
            }
           Image{
              id: imgLives
              anchors.left: points.right
              anchors.leftMargin: parent.width * 0.03
              anchors.verticalCenter: parent.verticalCenter
              source: "qrc:/assets/images/topPanelImages/Lives.png"
              width: parent.height * 0.4
              height: parent.height * 0.4
           }
           Rectangle{
               id: lives
               anchors.left: imgLives.right
               anchors.verticalCenter: parent.verticalCenter
               width: parent.height * 0.7
               anchors.leftMargin: parent.width * 0.02
               height: parent.height * 0.7
               color: "transparent" //transparent
               Text{
                   id: countLives
                   anchors.centerIn: parent
                   anchors.verticalCenter: parent.verticalCenter
                   text: "12312"
                   color: "white"
                   font.pixelSize: parent.height * 0.4
                   font.bold: true
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignBaseline
               }
            }

           Rectangle{
              anchors.right: parent.right
              anchors.verticalCenter: parent.verticalCenter
              anchors.top: parent.top
              anchors.bottom: parent.bottom
              anchors.rightMargin: parent.width * 0.03
              anchors.topMargin: parent.height * 0.18
              width: parent.width * 0.3
              height: parent.height
              color: "transparent"
              border.width: 1
              border.color: "white"
              radius: 17
               Text{
                   anchors.left: parent.left
                   anchors.verticalCenter: parent.verticalCenter
                   font.pixelSize: (parent.width * parent.height) * 0.0025
                   anchors.leftMargin: parent.width * 0.1
                   color: "white"
                   text: "Язык"
               }
               Rectangle{
                   anchors.right: parent.right
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.rightMargin: parent.width * 0.02

                   width: parent.width * 0.6
                   height: parent.height * 0.8
                   color: "white"
                   border.width: 1
                   border.color: "white"
                   radius: 15
                   Text{
                       anchors.centerIn: parent
                       font.pixelSize: (parent.width * parent.height) * 0.004
                       anchors.leftMargin: parent.width * 0.1
                       color: "#4E7CE2"
                       text: "Русский"
                    }
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
           color: "#FFFFFF"
       }
}

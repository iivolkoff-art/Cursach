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
           color: backgroundColor
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
                       testsCreater.createJson()
                       console.log("Вы создали json")
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
               anchors.rightMargin: parent.width * 0.01
               width: parent.width * 0.3
               height: parent.height
               //anchors.rightMargin: parent.width * 0.001
               color: "transparent"
               Image{
                  anchors.centerIn: parent
                  source: "qrc:/assets/images/topPanelImages/MaketLang.png"
                  width: parent.width
                  height: parent.height * 0.7
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

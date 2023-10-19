import QtQuick 2.12
import QtQuick.Window 2.12
import Qt5Compat.GraphicalEffects




Item{
    id: mainBottomPanel
    property color buttonColor: Qt.rgba(255, 255, 255, 0.5)
    property int constHeight: 640
    property int constWidth: 480
    property int heightCircle: (height / constHeight) * constHeight * 0.5
    property int widthCircle: (height / constHeight) * constHeight * 0.5

    property string visibleCircleBorder: "3"


   Rectangle{
       anchors.fill: parent
       color: backgroundColor
       Rectangle{
           id: firstButton
           //anchors.left: parent.left
           property string firstCircle: "1"

           anchors.right: secondButton.left
           anchors.verticalCenter: parent.verticalCenter
           anchors.rightMargin: parent.width * 0.07
           width: widthCircle
           height: heightCircle
           radius:  (parent.width + parent.height) * 0.3
           color: visibleCircleBorder === "1" ? "white" : buttonColor
           border.color: "#FFFFFF"
           border.width: 1

           signal numberChanged(int newNumber)

           MouseArea{
               anchors.fill: parent
               onClicked: {
                   visibleCircleBorder = firstButton.firstCircle
                   mainVisibleWindows = firstButton.firstCircle
               }
           }
       }
       Rectangle{
           id: secondButton
           property string secondCircle: "2"
           anchors.right: coolButton.left
           anchors.verticalCenter: parent.verticalCenter
           anchors.rightMargin: parent.width * 0.07
           width: widthCircle
           height: heightCircle
           radius:  (parent.width + parent.height) * 0.3
           color: visibleCircleBorder === "2" ? "white" : buttonColor
           border.color: "#FFFFFF"
           border.width: 1

           MouseArea{
               anchors.fill: parent
               onClicked: {
                   visibleCircleBorder = secondButton.secondCircle
                   mainVisibleWindows = secondButton.secondCircle

               }
           }
           Image{
               anchors.centerIn: parent
               source: visibleCircleBorder === "2" ? "qrc:/assets/images/buttonPanelImages/BlueSettings.png" : "qrc:/assets/images/buttonPanelImages/Settings.png"
               width: parent.width * 0.6
               height: parent.height * 0.6
            }
       }
       Rectangle{
           id: coolButton
//            anchors.horizontalCenter: parent
//            anchors.verticalCenter: parent
           anchors.centerIn: parent
           //anchors.leftMargin: parent.width * 0.1
           property string coolCircle: "3"

           width: widthCircle
           height: heightCircle
           radius:  (parent.width + parent.height) * 0.3
           color: visibleCircleBorder === "3" ? "white" : buttonColor
           border.color: "#FFFFFF"
           border.width: 1

           MouseArea{
               anchors.fill: parent
               onClicked: {
                   visibleCircleBorder = coolButton.coolCircle
                   mainVisibleWindows = coolButton.coolCircle
               }
           }
           Image{
               anchors.centerIn: parent
               source: visibleCircleBorder === "3" ? "qrc:/assets/images/buttonPanelImages/BlueTestWay.png" : "qrc:/assets/images/buttonPanelImages/TestWay.png"
               width: parent.width * 0.5
               height: parent.height * 0.5
            }
       }
       Rectangle{
           id: thirdButton
           anchors.left: coolButton.right
           //anchors.right: fourthButton.left
           property string thirdCircle: "4"
           anchors.verticalCenter: parent.verticalCenter
           anchors.leftMargin: parent.width * 0.07
           width: widthCircle
           height: heightCircle
           radius:  (parent.width + parent.height) * 0.3
           color: visibleCircleBorder === "4" ? "white" : buttonColor
           border.color: "#FFFFFF"
           border.width: 1
           //z: 2
//           DropShadow {
//               id: thirdShadow
//               anchors.fill: thirdButton
//               visible: visibleCircleBorder === "4" ? true : false
////               horizontalOffset: 3
////               verticalOffset: 3
//               radius: 3.0
//               color: "#ffffff"
//               source: thirdButton
//               spread: 0.4 // Значение spread увеличивает размер тени
//           }
            Image{
               anchors.centerIn: parent
               source: visibleCircleBorder === "4" ? "qrc:/assets/images/buttonPanelImages/BlueProfile.png" : "qrc:/assets/images/buttonPanelImages/Profile.png"
               width: parent.width * 0.45
               height: parent.height * 0.6
            }

           MouseArea{
               anchors.fill: parent
               onClicked: {
                   visibleCircleBorder = thirdButton.thirdCircle
                    mainVisibleWindows = thirdButton.thirdCircle
               }
           }
       }
       Rectangle{
           id: fourthButton
           anchors.left: thirdButton.right
           anchors.verticalCenter: parent.verticalCenter
           anchors.leftMargin: parent.width * 0.07
           property string fourthCircle: "5"

           width: widthCircle
           height: heightCircle
           radius:  (parent.width + parent.height) * 0.3
           color: visibleCircleBorder === "5" ? "white" : buttonColor
           border.color: "#FFFFFF"
           border.width: 1

           MouseArea{
               anchors.fill: parent
               onClicked: {
                   visibleCircleBorder = fourthButton.fourthCircle
                   mainVisibleWindows = fourthButton.fourthCircle

               }
           }
           Image{
               anchors.centerIn: parent
               source: "qrc:/assets/images/buttonPanelImages/TextHelper.png"
               width: parent.width * 0.5
               height: parent.height * 0.6
            }
       }

   }
   Rectangle {
       id: line
       anchors {
           left: parent.left
           right: parent.right
           top: parent.top
       }
       height: 1
       color: "#FFFFFF"
   }
}

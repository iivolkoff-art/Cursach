import QtQuick 2.12
import QtQuick.Window 2.12


Item{
    id: mainBottomPanel
    property color buttonColor: "#D9D9D9"
    property int constHeight: 640
    property int constWidth: 480
    property int heightCircle: (height / constHeight) * constHeight * 0.5
    property int widthCircle: (height / constHeight) * constHeight * 0.5

    property string visibleCircleBorder: "3"

//        function addBorder(item, itemNumber){

//            item.border.color = "#00B4CC";
//            item.border.width = 3;
//        }


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
               color: buttonColor
               border.color: visibleCircleBorder === firstCircle ? "#00B4CC" : "transparent"
               border.width: visibleCircleBorder === firstCircle ? 3 : 0

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
   //            anchors.left: firstButton.right
               property string secondCircle: "2"
               anchors.right: coolButton.left
               anchors.verticalCenter: parent.verticalCenter
               anchors.rightMargin: parent.width * 0.07
               width: widthCircle
               height: heightCircle
               radius:  (parent.width + parent.height) * 0.3
               color: buttonColor
               border.color: visibleCircleBorder === secondCircle ? "#00B4CC" : "transparent"
               border.width: visibleCircleBorder === secondCircle ? 3 : 0

               MouseArea{
                   anchors.fill: parent
                   onClicked: {
                       visibleCircleBorder = secondButton.secondCircle
                       mainVisibleWindows = secondButton.secondCircle

                   }
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
               color: "#008C9E"
               border.color: visibleCircleBorder === "3" ? "#00B4CC" : "transparent"
               border.width: visibleCircleBorder === coolCircle ? 3 : 0

               MouseArea{
                   anchors.fill: parent
                   onClicked: {
                       visibleCircleBorder = coolButton.coolCircle
                       mainVisibleWindows = coolButton.coolCircle
                   }
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
               color: buttonColor
               border.color: visibleCircleBorder === "4" ? "#00B4CC" : "transparent"
               border.width: visibleCircleBorder === thirdCircle ? 3 : 0

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
               color: buttonColor
               border.color: visibleCircleBorder === "5" ? "#00B4CC" : "transparent"
               border.width: visibleCircleBorder === fourthCircle ? 3 : 0

               MouseArea{
                   anchors.fill: parent
                   onClicked: {
                       visibleCircleBorder = fourthButton.fourthCircle
                       mainVisibleWindows = fourthButton.fourthCircle
                   }
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
           height: 2
           color: "#686F6F"
       }
}

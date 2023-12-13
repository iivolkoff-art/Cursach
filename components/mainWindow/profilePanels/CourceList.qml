import QtQuick 2.12

Item {
    id: courceList
    property string color: 'while'

    property int varRadius: 0


    property variant courses: ["Java,15",""]
    property var fsize




    ListView {
        anchors.fill: parent
        model: nestedModel
        delegate: categoryDelegate
        interactive: false
    }

    ListModel {
        id: nestedModel
        ListElement {
            categoryName: "Veggies"
            collapsed: true


            subItems: [
                //ListElement { itemName: "Java,15" },
                //ListElement { itemName: "Python,35" },
                ListElement { itemName: "C++,95" }
            ]
        }
    }

    Component {
        id: categoryDelegate
        Column {
            width: courceList.width

            Rectangle {

                id: categoryItem
                color: courceList.color
//                color: "transparent"
                height: courceList.height
                width: courceList.width

                radius: courceList.varRadius

                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 5
                    font.pixelSize: fsize
                    font.family: "Jost"
                    color: "#FFFFFF"
                    text: qsTr("Уровень изучения ЯП")
                }
                CircleWithText{
                    text: countOfLanguages
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: listButton.left
                }

                TriangleButton{
                    id: listButton
                    x: 0
                    y: 0
                    height: parent.height
                    width: height
                    triangleWidth: 20
                    triangleHeight: 20
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: nestedModel.setProperty(index, "collapsed", !collapsed)
                }
                function showList2() {
                    nestedModel.setProperty(index, "collapsed", !collapsed)
                }
            }

            Loader {
                id: subItemLoader
                visible: !collapsed
                property variant subItemModel : subItems
                sourceComponent: collapsed ? null : subItemColumnDelegate
                onStatusChanged: if (status == Loader.Ready) item.model = subItemModel
            }
        }

    }

    Component {
        id: subItemColumnDelegate
        Column {
            property alias model : subItemRepeater.model
            width: courceList.width
            Repeater {
                id: subItemRepeater
                property string procect: "value"
                delegate: Rectangle {
                    height: courceList.height
                    width: courceList.width

                    radius: courceList.varRadius

                    border.color: courceList.color
                    border.width: 1
                    color: isDark ? backgroundColor : whiteBackgroundColor


                    Text {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 15
                        font.pixelSize: fsize
                        font.family: "Jost"
                        color: isDark ? "white": "black"
//                        color: "#FFFFFF"
                        text: qsTr(itemName.split(',')[0])
                    }

                    CircleWithText{
                        text: itemName.split(',')[1] + "%"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                    }
                }
            }
        }
    }
}

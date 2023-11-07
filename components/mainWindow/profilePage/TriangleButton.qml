import QtQuick 2.12

Canvas {
    id: triangleButton
    antialiasing: true

    property int triangleWidth: 60
    property int triangleHeight: 60
    property color strokeStyle:  "#FFFFFF"
    property color fillStyle: "#FFFFFF"
    property int lineWidth: 3
    property bool fill: true
    property bool stroke: true
    property real alpha: 1.0
    states: [
        State {
            name: "pressed"; when: ma1.pressed
            PropertyChanges { target: triangleButton; fill: true; }
        }
    ]

    onLineWidthChanged:requestPaint();
    onFillChanged:requestPaint();
    onStrokeChanged:requestPaint();

    signal clicked()

    onPaint: {
        var ctx = getContext("2d");
        ctx.save();
        ctx.clearRect(0,0,triangleButton.width, triangleButton.height);
        ctx.strokeStyle = triangleButton.strokeStyle;
        ctx.lineWidth = triangleButton.lineWidth
        ctx.fillStyle = triangleButton.fillStyle
        ctx.globalAlpha = triangleButton.alpha
        ctx.lineJoin = "round";
        ctx.beginPath();

        ctx.translate( (0.5 *width - 0.5*triangleWidth), (0.5 * height - 0.5 * triangleHeight))

        ctx.moveTo(0,0 );
        ctx.lineTo(triangleWidth/2,triangleHeight);
        ctx.lineTo(triangleWidth,0);

        ctx.closePath();
        if (triangleButton.fill)
            ctx.fill();
        if (triangleButton.stroke)
            ctx.stroke();
        ctx.restore();
    }
    MouseArea{
        id: ma1
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}

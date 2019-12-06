import QtQuick 2.0
import QtQuick.Controls 2.12

TextField {

    width: 224
    height: 37
    color: "#7b7b7b"

    property color rectColor: "lightgray"

    //rectColor

    horizontalAlignment: Text.AlignLeft
    font.pixelSize: fontSize

    background: Rectangle{
        id: rectangle1
        color: parent.rectColor
        border.color:  "lightgrey"
        radius: 3
    }

}

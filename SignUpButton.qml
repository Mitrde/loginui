import QtQuick 2.0

Rectangle {
    id: signupbutton


    property string text

    color: "grey"
    radius: 5


    implicitWidth: buttonText.width + radius
    implicitHeight: buttonText.height + radius

    border {
        color: "grey"
        width: 1
    }

    Text {
        id: buttonText
        font.bold: true
        font.family: "Tahoma"
        font.pixelSize: 24
        color : "white"
        anchors.centerIn: parent
        text: signupbutton.text
    }

    signal clicked

    MouseArea {
            anchors.fill: parent
            onClicked: signupbutton.clicked()
    }
}

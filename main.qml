import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.calendar 1.0
import QtQuick.Extras 1.4
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import FieldsForm 1.0

Window {
    id: root
    visible: true
    width: 320
    height: 480
    title: qsTr("Sign Up App")
    property int fontSize : 20

    FForm{
        id: myForm
    }

    Text {
        id: element
        x: 7
        y: 17
        width: 207
        height: 79
        color: "#676565"
        text: qsTr("Sign Up")
        font.bold: true
        font.family: "Tahoma"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 45

        Text {
            id: textInput
            x: 8
            y: 71
            width: 275
            height: 20
            color: "#b5b1b1"
            text: qsTr("Please fill in this form to create new account!")
            font.pixelSize: 12
        }
    }





    CustomTextField{
        id: textInput1
        x: 16
        y: 122
        width: 224
        height: 37
        placeholderText: qsTr("First Name")
        MouseArea {
            id: mouseArea11
            hoverEnabled: false
            anchors.fill: parent
            onClicked: {
                mouseArea11.visible = false
                textInput1.text = ""
                textInput1.focus = true
            }
        }
    }



    CustomTextField{
        id: textInput2
        x: 16
        y: 169

        placeholderText: qsTr("Last Name")
        MouseArea {
            id: mouseArea12
            hoverEnabled: false
            anchors.fill: parent
            onClicked: {
                mouseArea12.visible = false
                parent.text = ""
                parent.focus = true
                }
        }
    }



    CustomTextField {
        id: textInput3
        x: 16
        y: 262


        placeholderText: qsTr("Email")

        MouseArea {
            id: mouseArea13
            anchors.rightMargin: 0
            anchors.bottomMargin: 1
            anchors.leftMargin: 0
            anchors.topMargin: -1
            hoverEnabled: false
            anchors.fill: parent
            onClicked: {
                mouseArea13.visible = false
                textInput3.text = ""
                textInput3.focus = true
                }
        }
    }

    CustomTextField {
        id: textInput4
        x: 16
        y: 308

        property color smth: "red"
        placeholderText: qsTr("Password")
        echoMode: TextInput.Normal

        MouseArea {
            id: mouseArea14
            hoverEnabled: false
            anchors.fill: parent
            onClicked: {
                mouseArea14.visible = false
                TextInput.Password = true
                textInput4.text = ""
                textInput4.focus = true
                textInput4.echoMode = TextInput.Password

                }
        }
    }


    ComboBox {
        id: control
        x: 16
        y: 216
        width: 224
        height: 37
        font.pixelSize: fontSize

        property color rectColor: "lightgray"


        model: ["Select your country","Germany", "France", "Switzerland"]

        delegate: ItemDelegate {
            width: control.width
            contentItem: Text {
                text: modelData
                color: "#7b7b7b"
                font: control.font
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
            highlighted: control.highlightedIndex === index
        }

        indicator: Canvas {
            id: canvas
            x: control.width - width - control.rightPadding
            y: control.topPadding + (control.availableHeight - height) / 2
            width: 12
            height: 8
            contextType: "2d"

            Connections {
                target: control
                onPressedChanged: canvas.requestPaint()
            }

            onPaint: {
                context.reset();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineTo(width / 2, height);
                context.closePath();
                context.fillStyle = control.pressed ? "#17a81a" : "#7b7b7b";
                context.fill();
            }
        }

        contentItem: Text {
            leftPadding: 0
            rightPadding: control.indicator.width + control.spacing

            text: control.displayText
            horizontalAlignment: Text.AlignLeft
            font: control.font
            color: control.pressed ? "#17a81a" : "#7b7b7b"
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 120
            implicitHeight: 40
            color: parent.rectColor
            border.color: parent.rectColor
            radius: 3
        }

        popup: Popup {
            y: control.height - 1
            width: control.width
            implicitHeight: contentItem.implicitHeight
            padding: 1

            contentItem: ListView {
                clip: true
                implicitHeight: contentHeight
                model: control.popup.visible ? control.delegateModel : null
                currentIndex: control.highlightedIndex

                ScrollIndicator.vertical: ScrollIndicator { }
            }

            background: Rectangle {
                border.color: "#21be2b"
                radius: 2
            }
        }
    }

    CheckBox {
        id: checkTerms
        x: 16
        y: 350
        text: qsTr("I accept the Terms of Use")
        checked: false
        property color rectColor: "white"

        indicator: Rectangle {
            implicitWidth: 26
            implicitHeight: 26
            x: checkTerms.leftPadding
            y: parent.height / 2 - height / 2
            radius: 3
            color: parent.rectColor
            border.color: checkTerms.down ? "#6a7b7b" : "#7b7b7b"

            Rectangle {
                width: 14
                height: 14
                x: 6
                y: 6
                radius: 2
                color: checkTerms.down ? "#6a7b7b" : "#7b7b7b"
                visible: checkTerms.checked
            }
        }

        contentItem: Text {
            text: checkTerms.text
            font: checkTerms.font
            opacity: enabled ? 1.0 : 0.3
            color: checkTerms.down ? "#6a7b7b" : "#7b7b7b"
            verticalAlignment: Text.AlignVCenter
            leftPadding: checkTerms.indicator.width + checkTerms.spacing
        }
    }

    SignUpButton{
        x: 16
        y: 401

        width: 156
        height: 52
        color: "skyblue"

        text: "SignUp"

        onClicked:{
            myForm.resetNotValidCount();
            textInput1.rectColor = (myForm.isFieldValid(textInput1.text, 1, !(mouseArea11.visible)))?"lightgray":"#f49090"
            textInput2.rectColor = (myForm.isFieldValid(textInput2.text, 0, !(mouseArea12.visible)))?"lightgray":"#f49090"
            textInput3.rectColor = (myForm.isFieldValid(textInput3.text, 1, !(mouseArea13.visible)))?"lightgray":"#f49090"
            textInput4.rectColor = (myForm.isFieldValid(textInput4.text, 1, !(mouseArea14.visible)))?"lightgray":"#f49090"
            control.rectColor = (myForm.isFieldValid(control.currentIndex, 3, !(false)))?"lightgray":"#f49090"
            checkTerms.rectColor = (myForm.isFieldValid(checkTerms.checkState, 2, !(false)))?"lightgray":"#f49090"

            //messageDialog.visible = myForm.isFormValid();
            if(myForm.isFormValid())
                popup.open()


        }
    }
    Popup {
           id: popup
           x: 100
           y: 100
           width: 200
           height: 300
           modal: true
           focus: true
           closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
           Text{
               id: popupText


               color: "#676565"
               text: qsTr("Sign Up")

               horizontalAlignment: Text.AlignLeft
               font.pixelSize: 16

           }
           Rectangle {
               id : formInfoRect
               width: 180; height: 200

               Item {
                   width: 180; height: 40
                   Column {
                       Text { text: "<b>FirstName:</b>" + textInput1.text }
                       Text { text: (myForm.isFieldValid(textInput2.text, 1, !(mouseArea12.visible)))?('<b>LastName:</b> ' + textInput2.text):("")  }
                       Text { text: '<b>Email:</b> ' + textInput3.text }
                       Text { text: '<b>Country:</b> ' + control.currentText }
                       Text { text: '<b>Password:</b> ' + textInput4.text }
                   }
               }
           }
           SignUpButton{
               text: "Add One More"
               color: "lightgrey"
               anchors.top: formInfoRect.bottom
               Text {
                   font.pixelSize: 16
                   color : "#7b7b7b"
                   anchors.centerIn: parent
               }
               onClicked:{
                   myForm.resetNotValidCount();
                   textInput1.clear();
                   textInput2.clear();
                   textInput3.clear();
                   textInput4.clear();
                   control.currentIndex = 0;
                   checkTerms.checkState = 0;
                   popup.close()
               }

           }
       }


}

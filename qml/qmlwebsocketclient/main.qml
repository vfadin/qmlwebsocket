import QtQuick 2.0
import QtWebSockets 1.0
import QtQuick.Controls 2.15
import QtQuick.Window 2.11

Rectangle {
    id: mainWindow
    width: 360
    height: 360
    color: "steelblue"

    WebSocket {
        id: socket
        url: "ws://localhost:3000"
        onTextMessageReceived: {
            textArea.text = textArea.text + message
        }
        onStatusChanged: if (socket.status == WebSocket.Error) {
                             console.log("Error: " + socket.errorString)
                         } else if (socket.status == WebSocket.Open) {
                             textArea.text += "\nSuccesfully connect\n"
                         } else if (socket.status == WebSocket.Closed) {
                             textArea.text += "\nSocket closed"
                         }
        active: true
    }


    Rectangle {
        id: rectangle
        x: 8
        y: 299
        width: 251
        height: 40
        color: "#ffffff"
    }

    Button {
        id: button
        x: 278
        y: 299
        width: 68
        height: 40
        text: qsTr("Send")
        onClicked: {
            if (socket.status == WebSocket.Error) {
                socket.active = !socket.active
                socket.active = !socket.active
            }

            if(textField.text != ""){
                socket.sendTextMessage('\n' + textField.text + ": " + textArea1.text);
                textArea1.text = "";
            }
            else textArea.text += "\nEnter nickname at first"
        }
    }

    ScrollView {
        id: scrollView
        x: 15
        y: 43
        width: 331
        height: 245

        TextArea {
            id: textArea
            x: -10
            y: -6
            width: 331
            height: 252
            placeholderText: qsTr("Text Area")
        }
    }

    ScrollView {
        id: scrollView1
        x: 8
        y: 299
        width: 251
        height: 40

        TextArea {
            id: textArea1
            x: -10
            y: -6
            width: 220
            height: 40
            placeholderText: qsTr("Input text")
        }
    }

    TextField {
        id: textField
        x: 208
        y: 8
        width: 138
        height: 29
        placeholderText: qsTr("Enter nickname")
    }
}

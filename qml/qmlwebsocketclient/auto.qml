import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: autorWindow
    signal signalExit
    width: 450
    height: 200
    TextField {
        id: textField
        x: 54
        y: 103
        placeholderText: qsTr("Input text")
    }

    Button {
        id: button
        x: 290
        y: 103
        text: qsTr("Confirm")
        onClicked: {
            autorWindow.signalExit()
            //mainWindow.show()
        }
    }

    Label {
        id: label
        x: 54
        y: 48
        width: 174
        height: 21
        text: qsTr("Enter nickname to continue")
    }

}

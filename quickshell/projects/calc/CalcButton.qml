import QtQuick

Rectangle {
    id: root

    Colors {
        id: colors
    }
    Dimensions {
        id: dims
    }

    property alias text: buttonText.text
    property color buttonColor: colors.buttonBg
    property color hoverColor: colors.buttonHover
    property color textColor: colors.textColor

    signal clicked

    color: buttonColor
    radius: dims.borderRadius

    Text {
        id: buttonText
        anchors.centerIn: parent
        color: textColor
        font.pixelSize: parent.height * dims.buttonFontRatio
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
        onPressed: root.color = hoverColor
        onReleased: root.color = buttonColor
    }
}

// calculator.qml
import QtQuick
import QtQuick.Controls
import Quickshell

Scope {
    Colors {
        id: colors
    }
    Dimensions {
        id: dims
    }
    CalculatorLogic {
        id: logic
        onDisplayUpdated: value => display.text = value
    }

    FloatingWindow {
        id: calcWindow
        width: dims.windowWidth
        height: dims.windowHeight
        minimumSize: Qt.size(200, 300)
        visible: true

        Rectangle {
            anchors.fill: parent
            color: colors.bgColor
            border.color: colors.buttonHover
            border.width: 1

            // Title bar for dragging
            Rectangle {
                id: titleBar
                width: parent.width
                height: parent.height * 0.08
                color: colors.displayBg

                Text {
                    anchors.centerIn: parent
                    text: "Calculator"
                    color: colors.textColor
                    font.pixelSize: parent.height * 0.5
                }

                // Close button
                Rectangle {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 5
                    width: parent.height * 0.7
                    height: parent.height * 0.7
                    color: closeMouseArea.containsMouse ? colors.clearColor : "transparent"
                    radius: 3

                    Text {
                        anchors.centerIn: parent
                        text: "×"
                        color: colors.textColor
                        font.pixelSize: parent.height * 0.8
                    }

                    MouseArea {
                        id: closeMouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: Qt.quit()
                    }
                }
            }

            Column {
                anchors.fill: parent
                anchors.topMargin: titleBar.height + parent.width * dims.marginRatio
                anchors.leftMargin: parent.width * dims.marginRatio
                anchors.rightMargin: parent.width * dims.marginRatio
                anchors.bottomMargin: parent.width * dims.marginRatio
                spacing: parent.height * dims.spacingRatio

                // Display
                Rectangle {
                    width: parent.width
                    height: (parent.parent.height - titleBar.height) * dims.displayHeightRatio
                    color: colors.displayBg
                    radius: dims.borderRadius

                    Text {
                        id: display
                        anchors.fill: parent
                        anchors.margins: parent.width * dims.displayMarginRatio
                        text: "0"
                        color: colors.textColor
                        font.pixelSize: parent.height * dims.displayFontRatio
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideLeft
                    }
                }

                // Buttons Grid
                Grid {
                    width: parent.width
                    height: (parent.parent.height - titleBar.height) * dims.gridHeightRatio
                    columns: 4
                    spacing: parent.width * dims.buttonSpacingRatio

                    property real buttonWidth: (width - spacing * 3) / 4
                    property real buttonHeight: (height - spacing * 4) / 5

                    // Row 1: C, /, *, -
                    CalcButton {
                        text: "C"
                        buttonColor: colors.clearColor
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.clear()
                    }
                    CalcButton {
                        text: "/"
                        buttonColor: colors.operatorColor
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.operatorPressed("/")
                    }
                    CalcButton {
                        text: "*"
                        buttonColor: colors.operatorColor
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.operatorPressed("*")
                    }
                    CalcButton {
                        text: "-"
                        buttonColor: colors.operatorColor
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.operatorPressed("-")
                    }

                    // Row 2: 7, 8, 9, +
                    CalcButton {
                        text: "7"
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.numberPressed("7")
                    }
                    CalcButton {
                        text: "8"
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.numberPressed("8")
                    }
                    CalcButton {
                        text: "9"
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.numberPressed("9")
                    }
                    CalcButton {
                        text: "+"
                        buttonColor: colors.operatorColor
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.operatorPressed("+")
                    }

                    // Row 3: 4, 5, 6
                    CalcButton {
                        text: "4"
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.numberPressed("4")
                    }
                    CalcButton {
                        text: "5"
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.numberPressed("5")
                    }
                    CalcButton {
                        text: "6"
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.numberPressed("6")
                    }
                    Rectangle {
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        color: "transparent"
                    }

                    // Row 4: 1, 2, 3, =
                    CalcButton {
                        text: "1"
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.numberPressed("1")
                    }
                    CalcButton {
                        text: "2"
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.numberPressed("2")
                    }
                    CalcButton {
                        text: "3"
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.numberPressed("3")
                    }
                    CalcButton {
                        text: "="
                        buttonColor: colors.equalsColor
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.calculate()
                    }

                    // Row 5: 0, .
                    CalcButton {
                        text: "0"
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: logic.numberPressed("0")
                    }
                    CalcButton {
                        text: "."
                        width: parent.buttonWidth
                        height: parent.buttonHeight
                        onClicked: {
                            if (logic.currentNumber.indexOf(".") === -1) {
                                logic.numberPressed(".");
                            }
                        }
                    }
                }
            }

            // Resize handle
            Rectangle {
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                width: 20
                height: 20
                color: "transparent"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.strokeStyle = colors.buttonHover;
                        ctx.lineWidth = 2;

                        // Draw resize grip lines
                        for (var i = 0; i < 3; i++) {
                            ctx.beginPath();
                            ctx.moveTo(width - 5 - i * 5, height);
                            ctx.lineTo(width, height - 5 - i * 5);
                            ctx.stroke();
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.SizeFDiagCursor
                    property point lastMousePos: Qt.point(0, 0)

                    onPressed: mouse => {
                        lastMousePos = Qt.point(mouse.x, mouse.y);
                    }

                    onPositionChanged: mouse => {
                        if (pressed) {
                            var dx = mouse.x - lastMousePos.x;
                            var dy = mouse.y - lastMousePos.y;

                            var newWidth = calcWindow.width + dx;
                            var newHeight = calcWindow.height + dy;

                            // Minimum size
                            if (newWidth >= 200) {
                                calcWindow.width = newWidth;
                            }
                            if (newHeight >= 300) {
                                calcWindow.height = newHeight;
                            }
                        }
                    }
                }
            }
        }
    }
}

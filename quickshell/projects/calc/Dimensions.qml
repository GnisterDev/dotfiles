import QtQuick

QtObject {
    // Window dimensions
    property int windowWidth: 280
    property int windowHeight: 400

    // Ratios for relative sizing
    property real marginRatio: 0.036          // 10/280
    property real spacingRatio: 0.025         // 10/400
    property real displayHeightRatio: 0.20    // 80/400
    property real gridHeightRatio: 0.75       // Remaining space for grid
    property real displayMarginRatio: 0.036   // 10/280
    property real displayFontRatio: 0.40      // Font size relative to display height
    property real buttonSpacingRatio: 0.036   // 10/280
    property real buttonFontRatio: 0.5       // Font size relative to button height

    // Border radius
    property int borderRadius: 5
}

import QtQuick 2.13

import easyApp.Style 1.0 as EaStyle

PropertyAnimation {
    duration: EaStyle.Times.themeChange
    alwaysRunToEnd: true
    easing.type: Easing.OutQuint
}

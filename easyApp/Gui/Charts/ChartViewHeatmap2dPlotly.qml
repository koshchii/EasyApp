import QtQuick
import QtQuick.Controls
import QtWebEngine

import EasyApp.Gui.Elements as EaElements

Rectangle {
    id: container

    property var z3dValues: [[1, 20, 30], [20, 1, 60], [30, 60, 1]]

    property int pageLoading: chartView.loading

    WebEngineView {
        id: chartView

        anchors.fill: parent
        anchors.bottomMargin: 20
        anchors.topMargin: 18
        anchors.leftMargin: 15
        anchors.rightMargin: 15

        backgroundColor: parent.color

        url: 'ChartTemplateHeatmap2dPlotly.html'

        onContextMenuRequested: {
            request.accepted = true
        }

        onLoadingChanged: {
            if (loadRequest.status === WebEngineView.LoadSucceededStatus) {
                setZ3dValues()
                redrawPlot()
            }
        }

        onWidthChanged: reload()
        onHeightChanged: reload()        

    }

    // Logic

    function setZ3dValues() {
        //chartView.runJavaScript(`setZ3dValues(${JSON.stringify(z3dValues)})`, function(result) { console.log(result); })
        chartView.runJavaScript(`setZ3dValues(${JSON.stringify(z3dValues)})`)
    }

    function redrawPlot() {
        chartView.runJavaScript(`redrawPlot()`)
    }

}

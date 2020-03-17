import QtQuick 2.3
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.3


Column{
    id:rootId

    property string labelText: "Velocity"
    property string unitsText: "KPH"
    property string labelFont: "Impact"
    property color labelColor: "white"
    property color unitsColor: "#505050"
    property string readoutFont: "Digital-7 Mono"
    property int readoutSize: 64
    property color readoutColor: "blue"
    property int stdSpacing: 10
    property int labelSize: 30
    property int unitsSize: 22
    property int headerWidth: 200
    property int headerheight: 110

    property int knobLabelSize: 12
    property int knobLabelSpacing: 30
    property real midValue: knobMinValue + (knobMaxValue - knobMinValue)/2

    property alias knobCurrentValue: knobId.currentValue
    property alias knobMinValue: knobId.minValue
    property alias knobMaxValue: knobId.maxValue



    spacing: stdSpacing
    Item {
        id: knobHeaderId
        height: 110
        width: 200
        Row{
            id: labelUnitsId
            spacing: stdSpacing
            Text {
                id: labelId
                text: labelText
                font{family: labelFont; pixelSize: labelSize}
                color: labelColor
            }
            Text {
                id: unitsId
                text: unitsText
                font{family: labelFont; pixelSize: unitsSize}
                color: unitsColor
                anchors.bottom: labelId.bottom
            }
        }
        Rectangle {
            id: readoutAreaId
            color:"skyblue"
            width: parent.width
            height: readoutSize
            anchors.top: labelUnitsId.bottom
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text {
                id: readoutValuereadoutSize
                text: knobId.currentValue.toFixed(knobId.digits)
                font{family: readoutFont; pixelSize: readoutSize}
                anchors{right: parent.right; rightMargin: 10}
                y: -2
                color: readoutColor
            }

        }
    }

    Text {
        text: midValue
        font{family: labelFont; pointSize: knobLabelSize}
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Knob{id : knobId}

    Row{
        anchors{ horizontalCenter: knobId.horizontalCenter}
        spacing: knobLabelSpacing
        Text {
            id: leftLabel
            text: knobMinValue > 0 ? "+" + knobMinValue: knobMinValue
            font{family: labelFont; pointSize: knobLabelSize}
            color:"white"
        }
        Text {
            text: knobMaxValue > 0 ? "+" + knobMaxValue: knobMaxValue
            font{family: labelFont; pointSize: knobLabelSize}
            color:"white"
        }
    }
}

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

Window {
    id:mainViewWin
    visible: true
    width: 1024
    height: 600
    title: qsTr(MainViewMgr.appName + " " + MainViewMgr.appNameVer)

    property string boldLabelFont: "Impact"

    property real hoverOpacity : 0.85
    property string headerFontFamily: "Tahoma"
    property int companyFontSize : 10
    property string companyFontColor: "darkred"
    property int headerFontSize: 18
    property string headerBgColor: "white"
    property string graidentStartColor: "skyblue"
    property string graidentEndColor: "blue"
    property int rowLeftMargin: 30

    property real minVelocity: -250
    property real maxVelocity: 250
    property real minDistance: 70
    property real maxDistance: 200

    property var velocities: [MainViewMgr.velocityPreset1, MainViewMgr.velocityPreset2, MainViewMgr.velocityPreset3, MainViewMgr.velocityPreset4]
    property var distances: [MainViewMgr.distancePreset1, MainViewMgr.distancePreset2, MainViewMgr.distancePreset3, MainViewMgr.distancePreset4]



    Gradient{
        id:appGradientId
        GradientStop{position: 0.0; color: graidentStartColor}
        GradientStop{position: 1.0; color: graidentEndColor}
    }

    // MAIN ViewSection

    Rectangle
    {
        id: mainViewRect
        objectName: "mainViewRect"


        anchors.fill: parent
        gradient: appGradientId


        Header{
            id:headerId
        }

        RowLayout{
            id:powerKnobRowId
            anchors{top: headerId.bottom; topMargin: 15; left: parent.left; right: parent.right; leftMargin: rowLeftMargin}

            RfPower{}
            KnobControl{
                id:velocityId
                knobMaxValue: maxVelocity
                knobMinValue: minVelocity
                labelText: "Velocity"
                unitsText: "KPH"
                knobCurrentValue: MainViewMgr.velocity
                onKnobCurrentValueChanged: MainViewMgr.velocity = knobCurrentValue
            }

            KnobControl{
                id:distanceId
                knobMaxValue: maxDistance
                knobMinValue: minDistance
                labelText: "Distance"
                unitsText: "M"
                knobCurrentValue: MainViewMgr.distance
                onKnobCurrentValueChanged: MainViewMgr.distance = knobCurrentValue
            }


        }

        RowLayout
        {
            id: presetRowId
            anchors{bottom: parent.bottom; bottomMargin: 10; left: parent.left; right: parent.right; leftMargin: rowLeftMargin}
            Layout.alignment: Qt.AlignBottom

            PresetButton {
                presetTitle: "Preset 1"
                labelFont: boldLabelFont
                velocity: velocities[0]
                distance: distances[0]
                velocityControl: velocityId
                distanceControl: distanceId
                hoverOpacity: mainViewWin.hoverOpacity
            }
            PresetButton {
                presetTitle: "Preset 2"
                labelFont: boldLabelFont
                velocity: velocities[1]
                distance: distances[1]
                velocityControl: velocityId
                distanceControl: distanceId
                hoverOpacity: mainViewWin.hoverOpacity
            }
            PresetButton {
                presetTitle: "Preset 3"
                labelFont: boldLabelFont
                velocity: velocities[2]
                distance: distances[2]
                velocityControl: velocityId
                distanceControl: distanceId
                hoverOpacity: mainViewWin.hoverOpacity
            }
            PresetButton {
                presetTitle: "Preset 4"
                labelFont: boldLabelFont
                velocity: velocities[3]
                distance: distances[3]
                velocityControl: velocityId
                distanceControl: distanceId
                hoverOpacity: mainViewWin.hoverOpacity
            }
        }
    }


}

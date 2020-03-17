import QtQuick 2.3
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.3

Item {
    id: rootId

    property string presetTitle: "Preset"
    property string labelFont: "Impact"
    property string presetFontFamily: "Tahoma"
    property int presetFontSize: 16
    property real velocity
    property real distance
    property int digits: 1
    property url btnDownSrc: "images/Images/SVG/Controls/ActionButton/BtnBGRegular.svg"
    property url btnUpSrc: "images/Images/SVG/Controls/ActionButton/BtnBGPressed.svg"
    property url imageSrc: btnUpSrc
    property bool clickEvent: false
    property var distanceControl
    property var velocityControl
    property real hoverOpacity: .1


    height: presetLayout.height
    width:  presetLayout.width

    function sendPreset(mouse)
    {
        clickEvent = true;
        distanceControl.knobCurrentValue = distance;
        velocityControl.knobCurrentValue = velocity;
    }

    ColumnLayout {
        id:presetLayout
        Text {
            text: presetTitle
            Layout.alignment: Qt.AlignCenter
            color: "white"
            font.family: labelFont
            font.pointSize: 16
        }

        Image{
            id: buttonImage
            source: imageSrc

            MouseArea {
                id: mouseAreaForButton
                anchors.fill: parent
                onClicked: sendPreset(mouse)
                onPressed: imageSrc = btnDownSrc
                onReleased: imageSrc = btnUpSrc
                hoverEnabled: true
                onHoveredChanged: parent.opacity = containsMouse ? hoverOpacity : 1.0
            }

            Column {
                width: parent.width
                anchors{
                    top: parent.top
                    topMargin: 5
                }
                spacing: 5
                Text {
                    width: parent.width
                    text: velocity.toFixed(digits) + "KPH"
                    font.family: presetFontFamily
                    font.weight: Font.Bold
                    font{pointSize: presetFontSize}
                    color: "black"
                    horizontalAlignment: Qt.AlignHCenter
                }

                Text {
                    width: parent.width
                    text: distance.toFixed(digits) + "M"
                    font.family: presetFontFamily
                    font.weight: Font.Bold
                    font{pointSize: presetFontSize}
                    color: "ghostwhite"
                    horizontalAlignment: Qt.AlignHCenter
                }
            }
        }
    }




}

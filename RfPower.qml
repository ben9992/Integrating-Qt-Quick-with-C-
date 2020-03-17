import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12


ColumnLayout
{
    id:powerAreaId

    property url powerOffSrc: "images/Images/PNG/RFPower/poweroff.png"
    property url powerOnSrc: "images/Images/PNG/RFPower/poweron.png"
    property url powerSrc: powerOffSrc
    property bool powerOn: MainViewMgr.powerOn

    function togglePower()
    {
        powerOn = ! powerOn
        powerSrc = powerOn ? powerOnSrc : powerOffSrc
        MainViewMgr.powerOn = powerOn
    }


    Layout.alignment: Qt.AlignTop
    Text {
        text: qsTr("RF Power")
        Layout.alignment: Qt.AlignCenter
        color: "white"
        font.pointSize: 16
        font.family: boldLabelFont
    }
    Image {
        id: powerBtnId
        source: powerSrc
        Layout.preferredWidth: 64
        Layout.preferredHeight: Layout.preferredWidth

        MouseArea{
            onClicked: togglePower()
            anchors.fill: parent
            hoverEnabled: true
            onHoveredChanged: parent.opacity = containsMouse ? hoverOpacity : 1.0
        }
    }
}

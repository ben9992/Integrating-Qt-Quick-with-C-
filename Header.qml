import QtQuick 2.3
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.3

Rectangle
{
    id: rectMain
    color: headerBgColor
    anchors { top: parent.top; left: parent.left; right: parent.right;}
    height: 65

    RowLayout
    {
        id: logoGrid
        anchors{left:  parent.left; right: parent.right}

        Image {
            id: swatLogo
            source: "images/Images/PNG/Platform/DrivingIndicationComputer.png"

        }
        Text {
            text: qsTr("Software\nTech\nand whats beyond them\nJapan, Inc.")
            font{family: headerFontFamily; pointSize: companyFontSize}
            color: companyFontColor
        }

        Text {
            text: MainViewMgr.appName
            font{family: headerFontFamily; pointSize: headerFontSize; weight: Font.Bold}
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true;
            color: graidentEndColor
        }
    }
}

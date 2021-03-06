import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {
    id: aboutPage
    Column {
        anchors.fill: parent
        id: contentColumn
        PageHeader {
            title: qsTr("about")
        }
        Image {
            id: logo
            source: "qrc:images/smpc-big.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: aboutPage.width - Theme.paddingLarge * 2
            height: width
            cache: false
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "SMPC"
            font.pixelSize: Theme.fontSizeExtraLarge
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Version:") + " " + versionstring
            font.pixelSize: Theme.fontSizeLarge
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Homepage"
            onClicked: {
                Qt.openUrlExternally('https://github.com/djselbeck/smpc')
            }
        }
        Separator {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - Theme.paddingLarge
            color: Theme.primaryColor
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                id: copyLeft
                text: "©"
                transform: Rotation {
                    id: mirror
                    origin.x:copyLeft.width/2
                    axis.x: 0
                    axis.y: 1
                    axis.z: 0
                    angle: 180
                }
            }

            Label {
                text: " 2013 by Hendrik Borghorst"
                font.pixelSize: Theme.fontSizeMedium
            }
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Licensed under GPLv3")
            font.pixelSize: Theme.fontSizeMedium
        }
        Separator {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - Theme.paddingLarge
            color: Theme.primaryColor
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Fetches covers from last.fm")
            font.pixelSize: Theme.fontSizeTiny
        }
    }
}

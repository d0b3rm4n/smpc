import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page
{
    id: settingsPage;
    SilicaListView {
        anchors.fill: parent
        anchors.margins: Theme.paddingMedium
        contentWidth: width
        header: PageHeader {
            title: qsTr("settings");
        }
        model: mainMenuModel
        delegate: BackgroundItem {
            Label {
                anchors.centerIn: parent
                text: name
            }
            onClicked: {
                parseClickedSettings(ident);
            }
        }
    }


    ListModel {
        id: mainMenuModel
        ListElement { name: qsTr("server settings"); ident:"servers";}
        ListElement { name: qsTr("outputs"); ident:"outputs";}
        ListElement { name: qsTr("update database"); ident:"updatedb";}
        ListElement { name: qsTr("about"); ident:"about";}
    }

    function parseClickedSettings(ident)
    {
        switch (ident) {
        case "about" :
            pageStack.push(Qt.resolvedUrl("AboutPage.qml"));
            break;
        case "servers" :
            pageStack.push(serverList);
            break;
        case "updatedb" :
            updateDB();
            break;
        case "outputs" :
            requestOutputs();
            break;
        }
    }
}

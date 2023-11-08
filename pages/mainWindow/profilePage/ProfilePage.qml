import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 2.12
import 'qrc:/components/mainWindow/profilePanels'

Item{
    id: profilePage
    property int rowWidth: width / 1.125

    ProfilePageCenter{
        rowWidth: parent.rowWidth
    }
}

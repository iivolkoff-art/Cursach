import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 2.12
import 'qrc:/components/mainWindow/profilePage'

Item{
    id: profilePage
    property int rowWidth: width / 1.125

//    property string userName: "Ваше имя"
//    property string userNumber: "+375 (33) 635-22-45"

//    property int userScore: 0
//    property double partOfLearned: 0.30
//    property int percentageOfLearned: partOfLearned * 100

//    property int countOfLanguages: 2

//    property string userId: "2549265659"

    ProfilePageCenter{
        rowWidth: parent.rowWidth
    }
}

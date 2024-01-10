#include "TestsWayPage.h"
#include <QJsonDocument>
#include <QJsonObject>

TestsWayPage::TestsWayPage() : file("TestsPartOneCPlus.json")
{
}

uint8_t TestsWayPage::getTestsCount(){
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return uint8_t();
    }

    QString jsonString = file.readAll();

    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());

    QJsonObject json = jsonDoc.object();
    int testCount = json.keys().count();

    return testCount;
}

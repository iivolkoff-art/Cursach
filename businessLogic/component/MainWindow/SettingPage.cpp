#include "SettingPage.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <qDebug>

SettingPage::SettingPage() : file("Settings.json")
{
    loadSettings();
}


void SettingPage::loadSettings() {
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QJsonObject jsonData;
        jsonData["appTheme"] = "true";

        file.close();  // Убедитесь, что файл закрыт перед его повторным открытием

        if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
            QJsonDocument jsonDoc(jsonData);
            file.write(jsonDoc.toJson());
            file.close();
            qDebug() << "JSON file created successfully.";
        } else {
            qWarning() << "Failed to open file for write.";
        }
    } else {
        isDarkTheme = getJsonSetting("appTheme");
        file.close();
    }
}



QString SettingPage::getJsonSetting(const QString& settingName){
    QString jsonString = file.readAll();

    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());

    QJsonObject obj = jsonDoc.object();
    QString question = obj[settingName].toString();

    return question;
}


void SettingPage::setSetting(const QString& settingName, const QString& value){
    if (!file.open(QIODevice::ReadWrite | QIODevice::Text)) {
        qDebug() << "Failed to open file for read/write.";
        return;
    }

    QString jsonString = file.readAll();
    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());
    QJsonObject obj = jsonDoc.object();
    obj[settingName] = value;

    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qDebug() << "Failed to open file for write.";
        return;
    }

    file.write(QJsonDocument(obj).toJson());
    file.close();
    if(settingName == "appTheme"){
        isDarkTheme = value;
    }

    qDebug() << "Setting " << settingName << " changed to " << isDarkTheme;
}


bool SettingPage::getIsDarkTheme(){
    return isDarkTheme == "true" ? true : false;
}

#include "SettingsManager.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <qDebug>

SettingsManager::SettingsManager() : file("Settings.json")
{
    loadSettings();
}


void SettingsManager::loadSettings() {
    isDarkTheme = "false";
    isForcedTheme = "false";
    qDebug() << "Load settings";
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QJsonObject jsonData;
        jsonData["appTheme"] = "false";
        jsonData["forcedTheme"] = "false";
        file.close();

        if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
            QJsonDocument jsonDoc(jsonData);
            file.write(jsonDoc.toJson());
            file.close();
            qDebug() << "JSON file created successfully.";
        } else {
            qWarning() << "Failed to open file for write.";
        }
    }
    else {
        file.close();
        isForcedTheme = getJsonSetting("forcedTheme");
        if (isForcedTheme == "true") {
            isDarkTheme = getJsonSetting("appTheme");
        }
        else {
            time_t currentTime;
            struct tm *localTime;
            currentTime = time(NULL);
            localTime = localtime(&currentTime);
            int hour = localTime->tm_hour;
            bool isNightTime = (hour >= 19 || hour < 7);
            if (isNightTime) {
                isDarkTheme = "true";
            }
        }
        file.close();
    }
}



QString SettingsManager::getJsonSetting(const QString& settingName){
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Failed to open file for read/write.";
        return QString();
    }
    QString jsonString = file.readAll();

    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());

    QJsonObject obj = jsonDoc.object();
    QString question = obj[settingName].toString();

    return question;
}


void SettingsManager::setSetting(const QString& settingName, const QString& value){
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
    if(settingName == "forcedTheme"){
        isForcedTheme = value;
    }

    qDebug() << "Setting " << settingName << " changed to " << isDarkTheme;
}


bool SettingsManager::getIsDarkTheme(){
    qDebug() << isDarkTheme;
    return isDarkTheme == "true" ? true : false;
}

bool SettingsManager::getIsForcedTheme(){
    qDebug() << isForcedTheme;
    return isForcedTheme == "true" ? true : false;
}





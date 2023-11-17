#include "LoginManager.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <QString>
#include <qDebug>
#include <QVector>
#include <QJsonArray>

LoginManager::LoginManager()
{

}

void LoginManager::createAccount(){
    return;
}

bool LoginManager::userdataExists() {
    QFile file("userdata.json");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return false;
    }
    return true;
}

bool LoginManager::accountExists(const QString& accountName) {
    QFile file("userdata.json");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return false;
    }

    QString jsonString = file.readAll();

    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());

    if (!jsonDoc.isNull() && jsonDoc.isObject()) {
        QJsonObject rootObject = jsonDoc.object();

        if (rootObject.contains(accountName) || accountName == "root") {
            return true;
        }
        else {
            return false;
        }
    }
    return false;
}

QString LoginManager::getPasswordFromJson(const QString& accountName) {
    QFile file("userdata.json");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return QString();
    }

    QString jsonString = file.readAll();

    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());

    if (!jsonDoc.isNull() && jsonDoc.isObject()) {
        QJsonObject rootObject = jsonDoc.object();

        if (rootObject.contains(accountName)) {
            QJsonObject innerObject = rootObject[accountName].toObject();
            if (innerObject.contains("password")) {
                QString password = innerObject["password"].toString();
                return password;
            }
        }
    }
    return QString();
}
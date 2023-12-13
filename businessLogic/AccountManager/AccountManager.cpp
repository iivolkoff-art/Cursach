#include "AccountManager.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <QString>
#include <qDebug>
#include <QVector>
#include <QJsonArray>
#include <qDebug>

AccountManager::AccountManager() {}

void AccountManager::createAccount(const QString& accountName, const QString& accountPassword, const QString& accountEmail){
    QFile file("userdata.json");

    if (!file.open(QIODevice::ReadWrite | QIODevice::Text)) return;

    QJsonDocument JsonDocument = QJsonDocument::fromJson(file.readAll());
    QJsonObject rootObject = JsonDocument.object();
    file.close();

    QJsonObject regDetails;
    regDetails["password"] = accountPassword;
    regDetails["email"] = accountEmail;

    rootObject[accountName] = regDetails;
    JsonDocument.setObject(rootObject);
    file.open(QFile::WriteOnly | QFile::Text | QFile::Truncate);
    file.write(JsonDocument.toJson(QJsonDocument::Indented));
    file.close();
}

bool AccountManager::userdataExists() {
    QFile file("userdata.json");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return false;
    }
    return true;
}

QJsonDocument AccountManager::getJSON() {
    QFile file("userdata.json");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return QJsonDocument();
    }

    QString jsonString = file.readAll();

    file.close();

    return QJsonDocument::fromJson(jsonString.toUtf8());
}

void AccountManager::setData(const QString& accountName, const QString& firstName, const QString& secondName, const QString& thirdName, const QString& telephone, const QString& email) {
    QJsonDocument jsonDoc = getJSON();
    QJsonObject innerObject;
    if (!jsonDoc.isNull() && jsonDoc.isObject()) {
        QJsonObject rootObject = jsonDoc.object();

        if (rootObject.contains(accountName)) {
            innerObject = rootObject[accountName].toObject();
        }
    }
    QFile file("userdata.json");
    QJsonObject rootObject = jsonDoc.object();

    QJsonObject regDetails;
    regDetails["password"] = innerObject["password"];
    regDetails["email"] = email;
    regDetails["firstName"] = firstName;
    regDetails["secondName"] = secondName;
    regDetails["thirdName"] = thirdName;
    regDetails["telephone"] = telephone;


    rootObject[accountName] = regDetails;
    jsonDoc.setObject(rootObject);
    file.open(QFile::WriteOnly | QFile::Text | QFile::Truncate);
    file.write(jsonDoc.toJson(QJsonDocument::Indented));
    file.close();
}

QString AccountManager::getPasswordFromJson(const QString& accountName) {
    QJsonDocument jsonDoc = getJSON();
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

QString AccountManager::getFirstNameFromJson(const QString& accountName) {
    QJsonDocument jsonDoc = getJSON();
    if (!jsonDoc.isNull() && jsonDoc.isObject()) {
        QJsonObject rootObject = jsonDoc.object();

        if (rootObject.contains(accountName)) {
            QJsonObject innerObject = rootObject[accountName].toObject();
            if (innerObject.contains("firstName")) {
                QString password = innerObject["firstName"].toString();
                return password;
            }
        }
    }
    return QString();
}

QString AccountManager::getSecondNameFromJson(const QString& accountName) {
    QJsonDocument jsonDoc = getJSON();
    if (!jsonDoc.isNull() && jsonDoc.isObject()) {
        QJsonObject rootObject = jsonDoc.object();

        if (rootObject.contains(accountName)) {
            QJsonObject innerObject = rootObject[accountName].toObject();
            if (innerObject.contains("secondName")) {
                QString password = innerObject["secondName"].toString();
                return password;
            }
        }
    }
    return QString();
}

QString AccountManager::getThirdNameFromJson(const QString& accountName) {
    QJsonDocument jsonDoc = getJSON();
    if (!jsonDoc.isNull() && jsonDoc.isObject()) {
        QJsonObject rootObject = jsonDoc.object();

        if (rootObject.contains(accountName)) {
            QJsonObject innerObject = rootObject[accountName].toObject();
            if (innerObject.contains("thirdName")) {
                QString password = innerObject["thirdName"].toString();
                return password;
            }
        }
    }
    return QString();
}

QString AccountManager::getTelephoneFromJson(const QString& accountName) {
    QJsonDocument jsonDoc = getJSON();
    if (!jsonDoc.isNull() && jsonDoc.isObject()) {
        QJsonObject rootObject = jsonDoc.object();

        if (rootObject.contains(accountName)) {
            QJsonObject innerObject = rootObject[accountName].toObject();
            if (innerObject.contains("telephone")) {
                QString password = innerObject["telephone"].toString();
                return password;
            }
        }
    }
    return QString();
}

QString AccountManager::getEmailFromJson(const QString& accountName) {
    QJsonDocument jsonDoc = getJSON();
    if (!jsonDoc.isNull() && jsonDoc.isObject()) {
        QJsonObject rootObject = jsonDoc.object();

        if (rootObject.contains(accountName)) {
            QJsonObject innerObject = rootObject[accountName].toObject();
            if (innerObject.contains("email")) {
                QString password = innerObject["email"].toString();
                return password;
            }
        }
    }
    return QString();
}

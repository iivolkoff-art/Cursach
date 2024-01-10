#include "AuthorizationWindow.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <QString>
#include <qDebug>
#include <QVector>
#include <QJsonArray>

AuthorizationWindow::AuthorizationWindow()
{

}

void AuthorizationWindow::createAccount(const QString& accountName, const QString& accountPassword, const QString& accountEmail){
    QFile file("userdata.json");

    if (!file.open(QIODevice::ReadWrite | QIODevice::Text)) return;

    QJsonDocument JsonDocument = QJsonDocument::fromJson(file.readAll());
    QJsonObject rootObject = JsonDocument.object();
    file.close();

    QJsonObject regDetails;
    regDetails["password"] = accountPassword;
    regDetails["other_info"] = accountEmail;

    rootObject[accountName] = regDetails;
    JsonDocument.setObject(rootObject);
    file.open(QFile::WriteOnly | QFile::Text | QFile::Truncate);
    file.write(JsonDocument.toJson(QJsonDocument::Indented));
    file.close();
}

bool AuthorizationWindow::userdataExists() {
    QFile file("userdata.json");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return false;
    }
    return true;
}

bool AuthorizationWindow::accountExists(const QString& accountName) {
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

QString AuthorizationWindow::getPasswordFromJson(const QString& accountName) {
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

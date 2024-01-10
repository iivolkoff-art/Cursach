#include "TestsWindow.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

TestsWindow::TestsWindow() : file("TestsPartOneCPlus.json")
{

}

QVector<QString> TestsWindow::getParametersOfId(const QString& testNumber, const QString& id) {
    QVector<QString> parameters;

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return parameters;
    }

    QString jsonString = file.readAll();
    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());

    QJsonObject rootObject = jsonDoc.object();
    if (rootObject.contains(testNumber)) {
        QJsonObject innerObject = rootObject[testNumber].toObject();
        if (innerObject.contains(id)) {
            QJsonObject obj = innerObject[id].toObject();
            if (obj.contains("parameter")) {
                QJsonArray parameterArray = obj["parameter"].toArray();
                for (int i = 0; i < parameterArray.size(); i++) {
                    if (parameterArray[i].isString()) {
                        parameters.append(parameterArray[i].toString());
                    }
                }
            }
        }
    }
    return parameters;
}

QString TestsWindow::getObjectFromJson(const QString& testNumber, const QString& id, const QString& objectJSON) {
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return QString();
    }

    QString jsonString = file.readAll();

    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());

    if (!jsonDoc.isNull() && jsonDoc.isObject()) {
        QJsonObject rootObject = jsonDoc.object();

        if (rootObject.contains(testNumber)) {
            QJsonObject innerObject = rootObject[testNumber].toObject();
            if (innerObject.contains(id)) {
                QJsonObject obj = innerObject[id].toObject();
                if (obj.contains(objectJSON)) {
                    QString question = obj[objectJSON].toString();
                    return question;
                }
            }
        }
    }
    return QString();
}

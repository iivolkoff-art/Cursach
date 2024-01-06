#include "testscreater.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <qDebug>
#include <QJsonArray>
#include <QTcpSocket>
#include <QVariant>
#include <thread>

TestsCreater::TestsCreater() : file("TestsPartOneCPlus.json"), serverReader(ServerReader(QHostAddress("127.0.0.1"), 55555))
{

}



QVector<QString> TestsCreater::getParametersOfId(const QString& testNumber, const QString& id) {
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

QString TestsCreater::getObjectFromJson(const QString& testNumber, const QString& id, const QString& objectJSON) {
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

void TestsCreater::getFilesFromServer(){
    std::thread t1([=]{
        serverReader.getFilesFromServer(file);
    });
    t1.detach();
}

uint8_t TestsCreater::getTestsCount(){
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

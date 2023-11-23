#include "testscreater.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <QString>
#include <qDebug>
#include <QVector>
#include <QJsonArray>
#include <QTcpSocket>
#include <QVariant>
#include <thread>


TestsCreater::TestsCreater()
{

}


QVector<QString> TestsCreater::getParametersOfId(const QString& testNumber, const QString& id) {
    QFile file("TestsPartOneCPlus.json");
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
    QFile file("TestsPartOneCPlus.json");

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
        QTcpSocket socket;
        socket.connectToHost("127.0.0.1", 55555);
        if (socket.waitForConnected(3000)){
            socket.write("File");
            if(socket.waitForReadyRead(3000)) {
                //From server
                QByteArray fileData = socket.readAll();
                QFile newFile("TestsPartOneCPlus.json");
                if (newFile.open(QIODevice::WriteOnly)) {
                    newFile.write(fileData);
                    newFile.close();
                    qDebug() << "File successfully received and saved.";
                } else {
                    qDebug() << "Error creating or writing to the file.";
                }
                socket.disconnectFromHost();
            }
            else {
                qDebug() << "Timeout waiting for response";
            }
        }
        else{
            qDebug() << "Connection failed";
        }
    });
    t1.detach();
}

#include "testscreater.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <QString>
#include <qDebug>
#include <QVector>
#include <QJsonArray>

#include <QVariant>


TestsCreater::TestsCreater()
{
    
}

void TestsCreater::createJson() {
    QJsonObject jsonObject;

    QJsonObject question1;
    question1["question"] = "Что такое С++?";
    question1["parameter"] = "хз";

    QJsonObject question2;
    question2["question"] = "Целочисленный  \n тип данных это?";
    question2["parameter"] = "int";

    QJsonObject question3;
    question3["question"] = "С++ является \n компилированным \n или \n интерпретируемым?";
    question3["parameter"] = "компилированным";

    QJsonObject question4;
    question4["question"] = "1+1=";
    question4["parameter"] = "2";

    QJsonObject question5;
    question5["question"] = "1+0=";
    question5["parameter"] = "1";

    QJsonObject question6;
    question6["question"] = "1+2=";
    question6["parameter"] = "3";

    QJsonObject question7;
    question7["question"] = "2+2=";
    question7["parameter"] = "4";

    QJsonObject question8;
    question8["question"] = "4+2=";
    question8["parameter"] = "6";

    QJsonObject question9;
    question9["question"] = "1+1=";
    question9["parameter"] = "2";

    QJsonObject question10;
    question10["question"] = "1+0=";
    question10["parameter"] = "1";

    jsonObject["1"] = question1;
    jsonObject["2"] = question2;
    jsonObject["3"] = question3;
    jsonObject["4"] = question4;
    jsonObject["5"] = question5;
    jsonObject["6"] = question6;
    jsonObject["7"] = question7;
    jsonObject["8"] = question8;
    jsonObject["9"] = question9;
    jsonObject["10"] = question10;

    QJsonDocument jsonDoc(jsonObject);

    QFile file("output1.json");

    if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        QByteArray jsonData = jsonDoc.toJson();
        file.write(jsonData);
        file.close();
    }
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

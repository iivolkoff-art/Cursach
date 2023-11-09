#include "testscreater.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <QString>
#include <qDebug>
#include <QVector>
#include <QJsonArray>

TestsCreater::TestsCreater()
{

}

void TestsCreater::createJson() {
    QJsonObject jsonObject;

    // Question 1
    QJsonObject question1;
    question1["question"] = "Что такое С++?";
    question1["parameter"] = QJsonArray{"хз", "яп", "хз2", "хз3"};
    question1["points"] = "15";
    question1["answer"] = "яп";

    // Question 2
    QJsonObject question2;
    question2["question"] = "Целочисленный  \n тип данных это?";
    question2["parameter"] = QJsonArray{"int", "double", "char", "string"};
    question2["points"] = "30";
    question2["answer"] = "int";

    // Question 3
    QJsonObject question3;
    question3["question"] = "С++ является \n компилированным \n или \n интерпретируемым?";
    question3["parameter"] = QJsonArray{"компилированный", "интерпретируемый", "хз", "хз2"};
    question3["points"] = "45";
    question3["answer"] = "компилированный";

    // Question 4
    QJsonObject question4;
    question4["question"] = "1+1=";
    question4["parameter"] = QJsonArray{"2", "1", "3", "4"};
    question4["points"] = "5";
    question4["answer"] = "2";

    // Question 5
    QJsonObject question5;
    question5["question"] = "1+0=";
    question5["parameter"] = QJsonArray{"2", "1", "3", "4"};
    question5["points"] = "5";
    question5["answer"] = "1";

    // Question 6
    QJsonObject question6;
    question6["question"] = "1+2=";
    question6["parameter"] = QJsonArray{"2", "1", "3", "4"};
    question6["points"] = "5";
    question6["answer"] = "3";

    // Question 7
    QJsonObject question7;
    question7["question"] = "2+2=";
    question7["parameter"] = QJsonArray{"2", "1", "3", "4"};
    question7["points"] = "5";
    question7["answer"] = "4";

    // Question 8
    QJsonObject question8;
    question8["question"] = "4+2=";
    question8["parameter"] = QJsonArray{"2", "6", "3", "4"};
    question8["points"] = "5";
    question8["answer"] = "6";

    // Question 9
    QJsonObject question9;
    question9["question"] = "1+1=";
    question9["parameter"] = QJsonArray{"2", "1", "3", "4"};
    question9["points"] = "5";
    question9["answer"] = "2";

    // Question 10
    QJsonObject question10;
    question10["question"] = "Сашка лучшая?";
    question10["parameter"] = QJsonArray{"Сашка самая лучшая", "Лучше Сашки нет", "Сашка 100% лучшая", "Да"};
    question10["points"] = "100";
    question10["answer"] = "Сашка 100% лучшая";

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


QVector<QString> TestsCreater::getParametersOfId(const QString& id) {
    QFile file("output1.json");
    QVector<QString> parameters;

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return parameters; // Верните пустой вектор, а не пустой массив []
    }

    QString jsonString = file.readAll();
    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());

    QJsonObject rootObject = jsonDoc.object();

    if (rootObject.contains(id)) {
        QJsonObject obj = rootObject[id].toObject();
        if (obj.contains("parameter")) {
            QJsonArray parameterArray = obj["parameter"].toArray();
            for (int i = 0; i < parameterArray.size(); i++) {
                if (parameterArray[i].isString()) {
                    parameters.append(parameterArray[i].toString());
                }
            }
        }
    }

    return parameters;
}

QString TestsCreater::getObjectFromJson(const QString& id, const QString& objectJSON){
    QFile file("output1.json");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return QString();
    }

    QString jsonString = file.readAll();

    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());

    QJsonObject rootObject = jsonDoc.object();

    if (rootObject.contains(id)) {
        QJsonObject obj = rootObject[id].toObject();

        if (obj.contains(objectJSON)) {
            QString question = obj[objectJSON].toString();
            return question;
        }
    }

    return QString();
}


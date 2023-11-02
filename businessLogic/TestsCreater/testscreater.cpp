#include "testscreater.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <QString>
#include <qDebug>


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

QString TestsCreater::getQuestionOfId(const QString& id) {
    QFile file("output1.json");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        return QString(); // Не удалось открыть файл, возвращаем пустую строку
    }

    // Считываем содержимое файла в строку
    QString jsonString = file.readAll();

    // Закрываем файл
    file.close();

    // Парсим JSON-строку в QJsonDocument
    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonString.toUtf8());

    // Получаем корневой объект
    QJsonObject rootObject = jsonDoc.object();

    // Проверяем, существует ли ключ с указанным id
    if (rootObject.contains(id)) {
        // Получаем объект с указанным id
        QJsonObject obj = rootObject[id].toObject();

        // Проверяем, существует ли ключ "question" в объекте
        if (obj.contains("question")) {
            // Получаем значение "question" и возвращаем его
            QString question = obj["question"].toString();
            return question;
        }
    }

    return QString(); // Если ключ "question" не найден, возвращаем пустую строку
}


QString TestsCreater::getParametersOfId(const QString& id) {
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

        if (obj.contains("parameter")) {
            QString question = obj["parameter"].toString();
            return question;
        }
    }

    return QString();
}

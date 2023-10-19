#include "testscreater.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <QString>
#include <qDebug>


TestsCreater::TestsCreater()
{

}

void TestsCreater::createJson(){
    QJsonObject jsonObject;
    qDebug() << "ebalo";
    jsonObject["parameter"] = "1234";

    QJsonDocument jsonDoc(jsonObject);

    QFile file("output.json");

    if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        QByteArray jsonData = jsonDoc.toJson();
        file.write(jsonData);
        file.close();
    }
}

QString TestsCreater::getInf(){
    QFile file("output.json");

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

    // Проверяем, существует ли ключ "parameter" в корневом объекте
    if (rootObject.contains("parameter")) {
        // Получаем значение "parameter" и возвращаем его
        QString value = rootObject["parameter"].toString();
        return value;
    }

    return QString(); // Если ключ "parameter" не найден, возвращаем пустую строку
}

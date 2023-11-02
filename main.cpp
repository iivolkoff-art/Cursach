#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "businessLogic/NetworkChecker/NetworkChecker.h"
#include "businessLogic/TextHelper/TextHelper.h"
#include "businessLogic/TestsCreater/testscreater.h"
#include <QDir>
#include <QDebug>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
//    QDir dir1(QDir::rootPath());
//    qDebug() << QDir::rootPath();
//    // Получить список файлов
//    QStringList files = dir1.entryList(QDir::Files);
//    // Вывести список файлов
//    for (const QString &file : files) {
//        qDebug() << file;
//    }

    QDir dir = QDir::currentPath();

    // Получить список файлов
    QStringList files = dir.entryList(QDir::Files);
    qDebug() << QDir::currentPath();

    // Вывести список файлов
    for (const QString &file : files) {
        qDebug() << file;
    }

    qmlRegisterType<NetworkChecker>("networkChecker", 1, 0, "NetworkChecker");
    qmlRegisterType<TestsCreater>("testsCreater", 1, 0, "TestsCreater");
    qmlRegisterType<TextHelper>("textHelper", 1, 0, "TextHelper");
    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

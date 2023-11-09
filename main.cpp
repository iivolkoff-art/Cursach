#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "businessLogic/NetworkChecker/NetworkChecker.h"
#include "businessLogic/TextHelper/TextHelper.h"
#include "businessLogic/TestsCreater/testscreater.h"
//#include "businessLogic/LoginManager/LoginManager.h"
#include <QDir>
#include <QDebug>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);


    //qmlRegisterType<LoginManager>("loginManager", 1, 0, "LoginManager");


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

#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include "businessLogic/NetworkChecker/NetworkChecker.h"
//#include "businessLogic/TextHelper/TextHelper.h"
//#include "businessLogic/TestsCreater/testscreater.h"
//#include "businessLogic/LoginManager/LoginManager.h"
//#include "businessLogic/SettingsManager/SettingsManager.h"

#include "businessLogic/component/authorizationWindow/AuthorizationWindow.h"
#include "businessLogic/component/MainWindow/SettingPage.h"
#include "businessLogic/component/MainWindow/TestsWayPage.h"
#include "businessLogic/component/MainWindow/MainWindow.h"
#include "businessLogic/component/MainWindow/TextHelper.h"
#include "businessLogic/component/TestWindow/TestsWindow.h"

#include <QDir>
#include <QDebug>
#include <QFontDatabase>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    SettingPage sp;

    qmlRegisterType<AuthorizationWindow>("authorizationWindow", 1, 0, "AuthorizationWindow");
    qmlRegisterType<SettingPage>("settingPage", 1, 0, "SettingPage");
    qmlRegisterType<TestsWayPage>("testsWayPage", 1, 0, "TestsWayPage");
    qmlRegisterType<MainWindow>("mainWindowClass", 1, 0, "MainWindowClass");
    qmlRegisterType<TextHelper>("textHelper", 1, 0, "TextHelper");
    qmlRegisterType<TestsWindow>("testsWindow", 1, 0, "TestsWindow");
//    qmlRegisterType<TextHelper>("textHelper", 1, 0, "TextHelper");
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


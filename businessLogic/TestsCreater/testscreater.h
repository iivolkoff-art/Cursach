#ifndef TESTSCREATER_H
#define TESTSCREATER_H
#include <QString>
#include <QObject>


class TestsCreater : public QObject
{
    Q_OBJECT
public:
    TestsCreater();
    Q_INVOKABLE void createJson();
    Q_INVOKABLE QString getInf();
};

#endif // TESTSCREATER_H

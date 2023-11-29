#ifndef TESTSCREATER_H
#define TESTSCREATER_H
#include <QString>
#include <QObject>
#include <QVector>


class TestsCreater : public QObject
{
    Q_OBJECT
private:

public:
    TestsCreater();
    Q_INVOKABLE QVector<QString> getParametersOfId(const QString& testNumber, const QString& id);
    Q_INVOKABLE QString getObjectFromJson(const QString& testNumber, const QString& id, const QString& objectJSON);
    Q_INVOKABLE void getFilesFromServer();
    Q_INVOKABLE uint8_t getTestsCount();
};

#endif // TESTSCREATER_H

#ifndef TESTSCREATER_H
#define TESTSCREATER_H
#include <QString>
#include <QObject>
#include <QVector>


class TestsCreater : public QObject
{
    Q_OBJECT
public:
    TestsCreater();
    Q_INVOKABLE void createJson();
    Q_INVOKABLE QVector<QString> getParametersOfId(const QString& id);
    Q_INVOKABLE QString getObjectFromJson(const QString& id, const QString& objectJSON);
};

#endif // TESTSCREATER_H

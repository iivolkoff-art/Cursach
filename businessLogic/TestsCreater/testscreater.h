#ifndef TESTSCREATER_H
#define TESTSCREATER_H
#include <QString>
#include <QObject>
#include <QVector>


class TestsCreater : public QObject
{
    Q_OBJECT
private:
    //QString testNumber;
public:
    TestsCreater();
    Q_INVOKABLE QVector<QString> getParametersOfId(const QString& testNumber, const QString& id);
    Q_INVOKABLE QString getObjectFromJson(const QString& testNumber, const QString& id, const QString& objectJSON);
    Q_INVOKABLE void getFilesFromServer();
    //Q_INVOKABLE void setTestNumber(QString testNumber);
};

#endif // TESTSCREATER_H

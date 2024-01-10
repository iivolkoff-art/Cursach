#ifndef TESTSWINDOW_H
#define TESTSWINDOW_H

#include <QObject>
#include <QFile>

class TestsWindow : public QObject
{
    Q_OBJECT
private:
    QFile file;
public:
    TestsWindow();
    Q_INVOKABLE QVector<QString> getParametersOfId(const QString& testNumber, const QString& id);
    Q_INVOKABLE QString getObjectFromJson(const QString& testNumber, const QString& id, const QString& objectJSON);

};

#endif // TESTSWINDOW_H

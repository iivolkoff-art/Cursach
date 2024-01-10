#ifndef TESTSWAYPAGE_H
#define TESTSWAYPAGE_H

#include <QObject>
#include <QFile>


class TestsWayPage : public QObject
{
    Q_OBJECT
private:
    QFile file;
public:
    TestsWayPage();
    Q_INVOKABLE uint8_t getTestsCount();

};

#endif // TESTSWAYPAGE_H

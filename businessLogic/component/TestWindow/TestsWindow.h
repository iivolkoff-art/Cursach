#ifndef TESTSWINDOW_H
#define TESTSWINDOW_H

#include <QObject>

class TestsWindow : public QObject
{
    Q_OBJECT
public:
    explicit TestsWindow(QObject *parent = nullptr);

signals:

};

#endif // TESTSWINDOW_H

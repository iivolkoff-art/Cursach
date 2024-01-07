#ifndef NETWORKCHECKER_H
#define NETWORKCHECKER_H
#include <QObject>
#include <QTcpSocket>

class NetworkChecker: public QObject
{
    Q_OBJECT
private:

public:
    NetworkChecker();
    Q_INVOKABLE bool check();
};

#endif // NETWORKCHECKER_H

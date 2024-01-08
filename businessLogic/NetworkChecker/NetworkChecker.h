#ifndef NETWORKCHECKER_H
#define NETWORKCHECKER_H
#include <QObject>
#include <QTcpSocket>
#include "CheckerConection.h"

class NetworkChecker: public QObject
{
    Q_OBJECT
private:
    bool result;
    CheckerConection* checkerConnection;
public:
    NetworkChecker();
    Q_INVOKABLE bool check();
};

#endif // NETWORKCHECKER_H

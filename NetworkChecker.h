#ifndef NETWORKCHECKER_H
#define NETWORKCHECKER_H
#include <QObject>

class NetworkChecker: public QObject
{
    Q_OBJECT
public:
    NetworkChecker();
    Q_INVOKABLE bool check();
};

#endif // NETWORKCHECKER_H

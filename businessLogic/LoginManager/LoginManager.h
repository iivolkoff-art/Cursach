#ifndef LOGINMANAGER_H
#define LOGINMANAGER_H
#include <QObject>

class LoginManager: public QObject
{
    Q_OBJECT
public:
    LoginManager();
    Q_INVOKABLE bool check();
};

#endif // LOGINMANAGER_H

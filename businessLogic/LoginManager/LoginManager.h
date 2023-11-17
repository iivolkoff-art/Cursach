#ifndef LOGINMANAGER_H
#define LOGINMANAGER_H
#include <QString>
#include <QObject>
#include <QVector>

class LoginManager: public QObject
{
    Q_OBJECT
public:
    LoginManager();
    Q_INVOKABLE void createAccount(const QString& accountName, const QString& accountPassword, const QString& accountEmail);
    Q_INVOKABLE bool userdataExists();
    Q_INVOKABLE bool accountExists(const QString& accountName);
    Q_INVOKABLE QString getPasswordFromJson(const QString& accountName);
};

#endif // LOGINMANAGER_H

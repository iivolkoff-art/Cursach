#ifndef AUTHORIZATIONWINDOW_H
#define AUTHORIZATIONWINDOW_H

#include <QString>
#include <QObject>

class AuthorizationWindow : public QObject
{
    Q_OBJECT
public:
    AuthorizationWindow();
    Q_INVOKABLE void createAccount(const QString& accountName, const QString& accountPassword, const QString& accountEmail);
    Q_INVOKABLE bool userdataExists();
    Q_INVOKABLE bool accountExists(const QString& accountName);
    Q_INVOKABLE QString getPasswordFromJson(const QString& accountName);

signals:

};

#endif // AUTHORIZATIONWINDOW_H

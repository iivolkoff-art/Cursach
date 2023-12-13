#ifndef ACCOUNTMANAGER_H
#define ACCOUNTMANAGER_H
#include <QString>
#include <QObject>
#include <QVector>
#include <QJsonDocument>

class AccountManager: public QObject
{
    Q_OBJECT
public:
    AccountManager();
    Q_INVOKABLE void createAccount(const QString& accountName, const QString& accountPassword, const QString& accountEmail);
    Q_INVOKABLE bool userdataExists();
    Q_INVOKABLE QJsonDocument getJSON();
    Q_INVOKABLE QString getPasswordFromJson(const QString& accountName);
    Q_INVOKABLE void setData(const QString& accountName, const QString& firstName, const QString& secondName, const QString& thirdName, const QString& telephone);
    Q_INVOKABLE QString getFirstNameFromJson(const QString& accountName);
    Q_INVOKABLE QString getSecondNameFromJson(const QString& accountName);
    Q_INVOKABLE QString getThirdNameFromJson(const QString& accountName);
    Q_INVOKABLE QString getTelephoneFromJson(const QString& accountName);
};

#endif // ACCOUNTMANAGER_H

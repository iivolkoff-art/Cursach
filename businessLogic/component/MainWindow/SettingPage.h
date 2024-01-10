#ifndef SETTINGPAGE_H
#define SETTINGPAGE_H

#include <QFile>
#include <QObject>

class SettingPage : public QObject
{
    Q_OBJECT
private:
    QFile file;
    QString isDarkTheme;

public:
    SettingPage();
    Q_INVOKABLE bool getIsDarkTheme();
    Q_INVOKABLE void setSetting(const QString& settingName, const QString& value);

protected:
    void loadSettings();
    QString getJsonSetting(const QString& settingName);


};

#endif // SETTINGPAGE_H

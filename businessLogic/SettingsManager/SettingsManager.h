#ifndef SETTINGSMANAGER_H
#define SETTINGSMANAGER_H

#include <QFile>
#include <QObject>

class SettingsManager : public QObject
{
    Q_OBJECT
private:
    QFile file;
    QString isDarkTheme;
    QString isForcedTheme;
public:
    SettingsManager();
    Q_INVOKABLE bool getIsDarkTheme();
    Q_INVOKABLE bool getIsForcedTheme();
    Q_INVOKABLE void setSetting(const QString& settingName, const QString& value);

protected:
    void loadSettings();
    QString getJsonSetting(const QString& settingName);
};

#endif // SETTINGSMANAGER_H

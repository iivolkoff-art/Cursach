#ifndef SETTINGPAGE_H
#define SETTINGPAGE_H

#include <QObject>

class SettingPage : public QObject
{
    Q_OBJECT
public:
    explicit SettingPage(QObject *parent = nullptr);

signals:

};

#endif // SETTINGPAGE_H

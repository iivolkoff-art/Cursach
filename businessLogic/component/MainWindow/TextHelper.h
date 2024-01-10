#ifndef TEXTHELPER_H
#define TEXTHELPER_H

#include <QObject>
#include <QHostAddress>
#include <QFile>

class TextHelper : public QObject
{
    Q_OBJECT
private:
    bool result;

    QHostAddress ip;
    uint16_t port;
    QFile newFile;

public:
    TextHelper();
    Q_INVOKABLE QString getDataFromScripFroServer();
    Q_INVOKABLE bool check();

};

#endif // TEXTHELPER_H

#ifndef TEXTHELPER_H
#define TEXTHELPER_H

#include <QObject>
#include <QHostAddress>
#include "../Structs/ServerStruct.h"

class TextHelper : public QObject
{
    Q_OBJECT
private:
    QHostAddress ip;
    uint16_t port;
    ServerData serverData;

public:
    TextHelper();
    Q_INVOKABLE QString getDataFromScripFroServer();

signals:
    //void serverResponseReceived(const QString &response);
};

#endif // TEXTHELPER_H

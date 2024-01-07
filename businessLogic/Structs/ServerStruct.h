#ifndef SERVERSTRUCT_H
#define SERVERSTRUCT_H

#include <QHostAddress>

struct ServerData{
    const QHostAddress ip = QHostAddress("127.0.0.1");
    const uint16_t port = 55555;

    ServerData();
};


#endif // SERVERSTRUCT_H

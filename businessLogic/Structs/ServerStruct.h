#ifndef SERVERSTRUCT_H
#define SERVERSTRUCT_H

#include <QHostAddress>

struct ServerData{
    QHostAddress ip;
    uint16_t port;

    ServerData();
};


#endif // SERVERSTRUCT_H

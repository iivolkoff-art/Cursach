#ifndef SERVERREADER_H
#define SERVERREADER_H

#include <QHostAddress>
#include <QFile>
#include "../Structs/ServerStruct.h"

class ServerReader
{
private:
    QHostAddress ip;
    uint16_t port;
    ServerData serverData;

public:
    ServerReader();
    void getFilesFromServer(QFile& newFile);
};

#endif // SERVERREADER_H

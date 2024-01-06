#ifndef SERVERREADER_H
#define SERVERREADER_H

#include <QHostAddress>
#include <QFile>

class ServerReader
{
private:
    QHostAddress ip;
    uint16_t port;


public:
    ServerReader();
    ServerReader(QHostAddress ip, quint16 port);
    void getFilesFromServer(QFile& newFile);
};

#endif // SERVERREADER_H

#ifndef SERVERDATAPROCCESOR_H
#define SERVERDATAPROCCESOR_H
#include <QObject>
#include <QHostAddress>
#include <QFile>
#include "../Structs/ServerStruct.h"
#include "../TextHelper/GetterPyScriptData.h"
#include "../TestsCreater/CreaterTestsFileFromServer.h"
#include "../NetworkChecker/CheckerConection.h"

class ServerDataProccesor : public GetterPyScriptData, public CreaterTestsFileFromServer, public CheckerConection
{
private:
    QHostAddress ip;
    uint16_t port;
    ServerData serverData;
    QFile newFile;

public:
    ServerDataProccesor();

    QString getPyFromServer() override;
    void createTestsFileFromServer() override;
    bool checkConnection() override;
};

#endif // SERVERDATAPROCCESOR_H

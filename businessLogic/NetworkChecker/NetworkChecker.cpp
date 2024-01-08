#include "NetworkChecker.h"
#include <thread>
#include <QNetworkAccessManager>
#include "../ServerDataProccesor/ServerDataProccesor.h"

NetworkChecker::NetworkChecker()
{
    checkerConnection = new ServerDataProccesor();
}

bool NetworkChecker::check(){
    std::thread t([&](){
        result = checkerConnection->checkConnection();
    });
    t.detach();
    return result;
}

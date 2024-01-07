#include "NetworkChecker.h"
#include <thread>
#include <QNetworkAccessManager>


NetworkChecker::NetworkChecker()
{

}

bool NetworkChecker::check(){
    bool result;
    std::thread t([&](){
        QTcpSocket sock;
        sock.connectToHost("www.google.com", 80);
        bool connected = sock.waitForConnected(3000);//ms
        if (connected) {
            sock.abort();
            result = true;
        } else{
            sock.abort();
            result = false;
        }
    });
    t.detach();
    return result;
}

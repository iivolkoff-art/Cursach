#include "NetworkChecker.h"

#include <QNetworkAccessManager>


NetworkChecker::NetworkChecker()
{

}

bool NetworkChecker::check(){
    QTcpSocket sock;
    sock.connectToHost("www.google.com", 80);
    bool connected = sock.waitForConnected(3000);//ms
    if (connected) {
        sock.abort();
        return true;
    } else{
        sock.abort();
        return false;
    }
}

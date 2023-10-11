#include "NetworkChecker.h"

#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QHostInfo>
#include <qDebug>
#include <QTimer>
#include <QEventLoop>
#include <QDebug>

NetworkChecker::NetworkChecker()
{

}

bool NetworkChecker::check(){
    QTcpSocket* sock = new QTcpSocket(this);
    sock->connectToHost("www.google.com", 80);
    bool connected = sock->waitForConnected(3000);//ms
    if (connected) {
        qDebug() << "прикол ";
        sock->abort();
        return true;
    } else{
        qDebug() << "прикол ";
        sock->abort();
        return false;
    }

}

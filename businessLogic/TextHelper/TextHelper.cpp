#include "TextHelper.h"
#include <QProcess>
#include <qDebug>
#include <QTcpSocket>
#include <thread>

TextHelper::TextHelper()
{
    this->ip = serverData.ip;
    this->port = serverData.port;
}

QString TextHelper::getDataFromScripFroServer() {
    QTcpSocket socket;
    socket.connectToHost(ip, port); // IP адрес и порт сервера
    QString result;
    if(socket.waitForConnected(3000)) {
        qDebug() << "Connected to server";

        //To server
        socket.write("Hello from client");

        if(socket.waitForReadyRead(3000)) {
            //From server
            result = QString(socket.readAll());
            qDebug() << "Response from server: " << result;
        }
        else {
            qDebug() << "Timeout waiting for response";
        }
        socket.disconnectFromHost();
    }
    else {
        qDebug() << "Connection failed";
    }
    return result;
}


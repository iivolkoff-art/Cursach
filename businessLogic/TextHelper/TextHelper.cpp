#include "TextHelper.h"
#include <QProcess>
#include <qDebug>
#include <QTcpSocket>
#include <thread>

TextHelper::TextHelper()
{

}

QString TextHelper::getDataFromScripFroServer() {
    QTcpSocket socket;
    socket.connectToHost("127.0.0.1", 55555); // IP адрес и порт сервера
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


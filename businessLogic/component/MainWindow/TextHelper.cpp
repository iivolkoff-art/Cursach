#include "TextHelper.h"
#include <QTcpSocket>
#include <thread>

TextHelper::TextHelper() : newFile("TestsPartOneCPlus.json")
{
    this->ip = QHostAddress("127.0.0.1");
    this->port = 55555;
}


bool TextHelper::check(){
    std::thread t([=]{
        QTcpSocket sock;
        sock.connectToHost(ip, port);
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

QString TextHelper::getDataFromScripFroServer(){
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

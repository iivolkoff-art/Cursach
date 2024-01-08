#include "ServerDataProccesor.h"
#include <QTcpSocket>

ServerDataProccesor::ServerDataProccesor() : newFile("TestsPartOneCPlus.json")
{
    this->ip = serverData.ip;
    this->port = serverData.port;
}


void ServerDataProccesor::createTestsFileFromServer(){
    QTcpSocket socket;
    socket.connectToHost(ip, port);
    if (socket.waitForConnected(3000)){
        socket.write("File");
        if(socket.waitForReadyRead(5000)) {
            QByteArray fileData = socket.readAll();
            if (newFile.open(QIODevice::WriteOnly)) {
                newFile.write(fileData);
                newFile.close();
                qDebug() << "File successfully received and saved.";
            } else {
                qDebug() << "Error creating or writing to the file.";
            }
            socket.disconnectFromHost();
        }
        else {
            qDebug() << "Timeout waiting for response";
        }
    }
    else{
        qDebug() << "Connection failed";
    }
}


QString ServerDataProccesor::getPyFromServer(){
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


bool ServerDataProccesor::checkConnection(){
    QTcpSocket sock;
    sock.connectToHost(ip, port);
    bool connected = sock.waitForConnected(3000);//ms
    if (connected) {
        sock.abort();
        return true;
    } else{
        sock.abort();
        return false;
    }
}

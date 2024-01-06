#include <QFile>
#include <QTcpSocket>
#include "ServerReader.h"

ServerReader::ServerReader()
{

}


ServerReader::ServerReader(QHostAddress ip, uint16_t port) : ip(ip), port(port)
{

}

void ServerReader::getFilesFromServer(QFile& newFile){
    QTcpSocket socket;
    socket.connectToHost(ip, port);
    if (socket.waitForConnected(3000)){
        socket.write("File");
        if(socket.waitForReadyRead(3000)) {
            //From server
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

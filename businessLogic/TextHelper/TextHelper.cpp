#include "TextHelper.h"
#include <QProcess>
#include <qDebug>
#include <QTcpSocket>

TextHelper::TextHelper()
{

}

QString TextHelper::getDataFromScripFroServer() {
    QTcpSocket socket;
    socket.connectToHost("192.168.43.24", 55555); // IP адрес и порт сервера
    QString result;

    if(socket.waitForConnected(3000)) {
        qDebug() << "Connected to server";

        // Отправляем сообщение на сервер
        socket.write("Hello from client");

        // Ждем ответ от сервера
        if(socket.waitForReadyRead(3000)) {
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


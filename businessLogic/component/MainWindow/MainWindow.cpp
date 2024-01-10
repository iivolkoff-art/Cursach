#include "MainWindow.h"
#include <thread>
#include <QTcpSocket>

MainWindow::MainWindow() : newFile("TestsPartOneCPlus.json")
{

    this->ip = QHostAddress("127.0.0.1");
    this->port = 55555;

}

void MainWindow::getFilesFromServer(){
    std::thread t([=]{
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
    });
    t.detach();
}

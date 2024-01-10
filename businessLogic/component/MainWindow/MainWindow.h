#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QHostAddress>
#include <QFile>

#include <QObject>

class MainWindow : public QObject
{
    Q_OBJECT
private:
    QHostAddress ip;
    uint16_t port;
    QFile newFile;
public:
    MainWindow();
    Q_INVOKABLE void getFilesFromServer();

};

#endif // MAINWINDOW_H

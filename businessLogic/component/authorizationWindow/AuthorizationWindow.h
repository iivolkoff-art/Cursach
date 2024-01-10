#ifndef AUTHORIZATIONWINDOW_H
#define AUTHORIZATIONWINDOW_H

#include <QObject>

class AuthorizationWindow : public QObject
{
    Q_OBJECT
public:
    explicit AuthorizationWindow(QObject *parent = nullptr);

signals:

};

#endif // AUTHORIZATIONWINDOW_H

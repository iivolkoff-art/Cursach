#ifndef TEXTHELPER_H
#define TEXTHELPER_H

#include <QObject>

class TextHelper : public QObject
{
    Q_OBJECT
public:
    TextHelper();
    Q_INVOKABLE QString getDataFromServerFromScript();
};

#endif // TEXTHELPER_H
